FROM python:2.7

# see https://github.com/desaster/kippo/wiki/Running-Kippo for dependencies' list
RUN pip install --no-cache-dir \
  twisted==15.1.0 \
  pyasn1 \
  pycrypto


ARG KIPPO_COMMIT=0d036350a719288f83078da8399572121f337f7e

ARG BUILD_DATE
ARG VCS_REF
LABEL org.label-schema.name="Kippo" \
  org.label-schema.description="SSH Honeypot" \
  org.label-schema.usage="/README.md" \
  org.label-schema.url="https://github.com/desaster/kippo" \
  org.label-schema.vcs-url="https://github.com/thomasleveil/docker-kippo.git" \
  org.label-schema.build-date=$BUILD_DATE \
  org.label-schema.vcs-ref=$VCS_REF \
  org.label-schema.schema-version="1.0.0-rc1" \
  kippo-version=${KIPPO_COMMIT}
COPY ./README.md /


# install Kippo
RUN useradd -d /kippo -s /bin/bash -m kippo -g sudo
WORKDIR /kippo-app
RUN chown kippo /kippo-app
USER kippo
RUN git clone --quiet --branch master --single-branch https://github.com/desaster/kippo.git . \
  && git reset --hard ${KIPPO_COMMIT}
RUN mv /kippo-app/kippo.cfg.dist /kippo-app/kippo.cfg


EXPOSE 2222
CMD ["twistd", "--nodaemon", "-y", "kippo.tac", "--pidfile=kippo.pid"]
