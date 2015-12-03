FROM ubuntu:trusty
MAINTAINER Thomas Léveil <thomasleveil@gmail.com>

RUN apt-get update \
  && apt-get -q -y install \
    git \
    openssl \
    python-dev \
    python-openssl \
    python-pyasn1 \
    python-twisted \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN useradd -d /kippo -s /bin/bash -m kippo -g sudo
RUN git clone -q --depth 1 https://github.com/desaster/kippo.git /kippo-app
RUN mv /kippo-app/kippo.cfg.dist /kippo-app/kippo.cfg
RUN chown kippo /kippo-app -R

EXPOSE 2222
USER kippo
WORKDIR /kippo-app
CMD ["twistd", "--nodaemon", "-y", "kippo.tac", "--pidfile=kippo.pid"]
