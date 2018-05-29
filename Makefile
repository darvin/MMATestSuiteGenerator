DOCKER_BUILDER_NAME=darvin/mathematica
WOLFRAM_DEB_FILE=wolfram-engine_10.0.0+2014012903_armhf.deb
WOLFRAM_URL_PATH=http://archive.raspberrypi.org/debian/pool/main/w/wolfram-engine/
WOLFRAM_DEB_FILE_RENAME=build/wolfram-engine.deb

.PHONY: builder install  docker-tests

all : builder docker-tests generate-tests

generate-tests-local :
	rm output/*  || true
	./export_tests_from_docs.m --local-wolfram

generate-tests : builder white-listed-docs
	rm -Rf output/*  || true
	./wolfram -script ./export_tests_from_docs.m --no-broken
	echo "Generated tests:"
	ls output/Tests/

run-tests :
	rm -Rf output/Results  || true
	./wolfram -script ./run_generated_tests.m
	echo "Test Results:"
	ls output/Results/*/*
	./generate_test_results_manifest.py > output/__index.json
	cp -R ./website/* ./output/


white-listed-docs :
	./download_documentation.sh

builder :
	echo "building docker image..." 
	mkdir build || true
	cp scripts_to_install/wolfram_wrapper build/
	if [ ! -f $(WOLFRAM_DEB_FILE_RENAME) ]; then \
		wget --quiet $(WOLFRAM_URL_PATH)/$(WOLFRAM_DEB_FILE) -O $(WOLFRAM_DEB_FILE_RENAME)  && \
        echo "dowloaded"; \
    fi
	docker build -t $(DOCKER_BUILDER_NAME)  -f Dockerfile ./build	
	echo "building docker image finished!"

install :
	cp wolfram /usr/local/bin/wolfram-on-docker

docker-tests :
	./wolfram -script docker_tests/plot.m	
	./wolfram -script docker_tests/plot_graphics.m
	test -s docker_tests/plot_graphics_output.png

builder-sh :
	docker run --rm -it --entrypoint "bash" -v `pwd`:/mnt $(DOCKER_BUILDER_NAME)

