FROM resin/rpi-raspbian:wheezy

RUN apt-get update --yes 
RUN apt-get install --yes  --no-install-recommends xvfb xauth

RUN echo debconf shared/accepted-wolfram-eula select true | debconf-set-selections
RUN apt-get install --yes  --no-install-recommends wolfram-engine



ENV DEB_FILE wolfram-engine.deb
COPY ./wolfram-engine.deb ./wolfram-engine.deb

RUN dpkg --force-all -i  *.deb && rm *.deb

RUN apt-get install --yes  --no-install-recommends parallel

COPY ./entrypoint.sh /opt/entrypoint.sh

WORKDIR /mnt

ENV export DISPLAY=:0

ENTRYPOINT ["/opt/entrypoint.sh"]