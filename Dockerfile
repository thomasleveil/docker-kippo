FROM ubuntu:trusty
MAINTAINER Thomas Léveil <thomasleveil@gmail.com>

ADD build/ /tmp/build/

RUN bash /tmp/build/setup-apt-mirrors.sh
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -q -y install python-dev openssl python-openssl python-pyasn1 python-twisted subversion

RUN useradd -d /kippo -s /bin/bash -m kippo -g sudo
RUN svn checkout http://kippo.googlecode.com/svn/trunk/ /kippo
RUN mv /kippo/kippo.cfg.dist /kippo/kippo.cfg
RUN chown kippo /kippo -R


# Clean up when done.
RUN rm -r /tmp/build/
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 2222
USER kippo
WORKDIR /kippo
CMD ["twistd", "--nodaemon", "-y", "kippo.tac", "--pidfile=kippo.pid"]