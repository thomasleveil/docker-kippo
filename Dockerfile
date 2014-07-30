FROM ubuntu:trusty
MAINTAINER Thomas Léveil <thomasleveil@gmail.com>

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -q -y install python-dev openssl python-openssl python-pyasn1 python-twisted git

RUN useradd -d /kippo -s /bin/bash -m kippo -g sudo
RUN git clone https://github.com/desaster/kippo.git /tmp/kippo/
RUN cp -R /tmp/kippo/* /kippo/
RUN mv /kippo/kippo.cfg.dist /kippo/kippo.cfg
RUN chown kippo /kippo -R

EXPOSE 2222
USER kippo
WORKDIR /kippo
CMD ["twistd", "--nodaemon", "-y", "kippo.tac", "--pidfile=kippo.pid"]