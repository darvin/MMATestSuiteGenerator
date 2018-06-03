.EXPORT_ALL_VARIABLES:

DOCKER_BUILDER_NAME=mmacompat/mathematica
WOLFRAM_DEB_FILE=wolfram-engine_10.0.0+2014012903_armhf.deb
WOLFRAM_URL_PATH=http://archive.raspberrypi.org/debian/pool/main/w/wolfram-engine/
WOLFRAM_DEB_FILE_RENAME=build/wolfram-engine.deb
ifneq ($(LOCAL),1)
MATHEMATICA_RUN_PREFIX=docker run --rm -v $(shell pwd):/mnt $(DOCKER_BUILDER_NAME)
CORES=2
DOC_PATH=build_docs
else
DOC_PATH=/Applications/Mathematica.app/Documentation/English/System
CORES=+0
MATHEMATICA_RUN_PREFIX=
endif

.PHONY: docker mathematica-self-tests generate-compat-tests run-compat-tests website 

all : clean docker mathematica-self-tests generate-compat-tests run-compat-tests website


clean :
	rm -Rf ./output/ || true

generate-compat-tests :
	./export_all_tests_from_docs.sh
	echo "Generated tests:"
	ls output/Tests/

run-compat-tests :
	./test_runners/mathematica-on-docker.sh
	echo "Test Results:"
	ls output/Results/*/*
	ls ./output/

generate-website :
	./generate_website.sh

clean-website :
	rm output/*/*/*.html || true
	rm output/*/*/*.json || true
	rm -Rf output/*/*/assets || true
	rm output/index.html || true

website : clean-website generate-website

serve-website : clean-website generate-website
	cd ./output/
	`npm bin`/http-server ./ -o

mathematica-self-tests :
	rm docker_tests/plot_graphics_output.png || true
	$(MATHEMATICA_RUN_PREFIX) wolfram -script docker_tests/plot.m	
	$(MATHEMATICA_RUN_PREFIX) wolfram -script docker_tests/plot_graphics.m
	test -s docker_tests/plot_graphics_output.png

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

docker-sh :
	docker run --rm -it --entrypoint "bash" -v `pwd`:/mnt $(DOCKER_BUILDER_NAME)

