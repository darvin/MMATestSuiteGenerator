.EXPORT_ALL_VARIABLES:

DOCKER_BUILDER_NAME=darvin/mathematica
WOLFRAM_DEB_FILE=wolfram-engine_10.0.0+2014012903_armhf.deb
WOLFRAM_URL_PATH=http://archive.raspberrypi.org/debian/pool/main/w/wolfram-engine/
WOLFRAM_DEB_FILE_RENAME=build/wolfram-engine.deb
ifneq ($(LOCAL),1)
MATHEMATICA_RUN_PREFIX=docker run --rm -v $(shell pwd):/mnt $(DOCKER_BUILDER_NAME)
else

endif

.PHONY: builder install  docker-tests

all : builder docker-tests generate-compat-tests run-compat-tests

generate-compat-tests : builder download-docs
	rm -Rf output/*  || true
	./export_all_tests_from_docs.sh
	echo "Generated tests:"
	ls output/Tests/

run-compat-tests :
	rm -Rf output/Results  || true
	echo "Running tests in Mathematica on Docker"
	$(MATHEMATICA_RUN_PREFIX) ./test_runners/mathematica-on-docker.sh
	echo "Test Results:"
	ls output/Results/*/*
	pwd
	ls ./output/
	sudo chown -R $(USER):$(USER) output/
	./generate_test_results_manifest.py
	cp -R ./website/* ./output/

mathematica-self-tests :
	rm docker_tests/plot_graphics_output.png || true
	$(MATHEMATICA_RUN_PREFIX) wolfram -script docker_tests/plot.m	
	$(MATHEMATICA_RUN_PREFIX) wolfram -script docker_tests/plot_graphics.m
	test -s docker_tests/plot_graphics_output.png

download-docs :
	./download_documentation.sh

docker :
	echo "building docker image..." 
	mkdir build || true
	cp entrypoint.sh build/
	if [ ! -f $(WOLFRAM_DEB_FILE_RENAME) ]; then \
		wget --quiet $(WOLFRAM_URL_PATH)/$(WOLFRAM_DEB_FILE) -O $(WOLFRAM_DEB_FILE_RENAME)  && \
        echo "dowloaded"; \
    fi
	docker build -t $(DOCKER_BUILDER_NAME)  -f Dockerfile ./build	
	echo "building docker image finished!"

install :
	cp wolfram /usr/local/bin/wolfram-on-docker


docker-sh :
	docker run --rm -it --entrypoint "bash" -v `pwd`:/mnt $(DOCKER_BUILDER_NAME)

