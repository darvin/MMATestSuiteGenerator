FROM resin/rpi-raspbian:wheezy

RUN apt-get update --yes 
RUN apt-get install --yes  --no-install-recommends xvfb xauth

RUN echo debconf shared/accepted-wolfram-eula select true | debconf-set-selections
RUN apt-get install --yes  --no-install-recommends wolfram-engine



ENV DEB_FILE wolfram-engine.deb

COPY ./wolfram-engine.deb ./wolfram-engine.deb
COPY scripts_to_install/wolfram_wrapper /usr/local/bin/

RUN dpkg --force-all -i  *.deb && rm *.deb


WORKDIR /mnt

ENTRYPOINT ["/usr/local/bin/wolfram_wrapper"]