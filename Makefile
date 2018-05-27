DOCKER_BUILDER_NAME=darvin/mathematica
WOLFRAM_DEB_FILE=wolfram-engine_10.0.0+2014012903_armhf.deb
WOLFRAM_URL_PATH=http://archive.raspberrypi.org/debian/pool/main/w/wolfram-engine/
WOLFRAM_DEB_FILE_RENAME=build/wolfram-engine.deb

.PHONY: builder install  docker-tests

all : builder docker-tests generate-tests


generate-tests : builder
	./wolfram -script ./export_tests_from_docs.m --no-broken

builder :
	echo "building docker image..." 
	mkdir build || true
	if [ ! -f $(WOLFRAM_DEB_FILE_RENAME) ]; then \
		wget $(WOLFRAM_URL_PATH)/$(WOLFRAM_DEB_FILE) && \
		mv $(WOLFRAM_DEB_FILE) $(WOLFRAM_DEB_FILE_RENAME)  && \
        echo "dowloaded"; \
    fi
	docker build -t $(DOCKER_BUILDER_NAME)  -f Dockerfile ./build	
	echo "building docker image finished!"

install :
	cp wolfram /usr/local/bin/wolfram-on-docker

docker-tests :
	./wolfram -script docker_tests/plot.m	
	./wolfram -script docker_tests/plot_graphics.m

builder-sh :
	docker run --rm -it --entrypoint "bash" -v `pwd`:/mnt $(DOCKER_BUILDER_NAME)

