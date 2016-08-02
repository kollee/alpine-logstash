FROM kollee/alpine-java:latest

# install plugin dependencies
RUN apk add --no-cache libzmq su-exec bash

# the "ffi-rzmq-core" gem is very picky about where it looks for libzmq.so
RUN mkdir -p /usr/local/lib /opt \
	&& ln -s /usr/lib/*/libzmq.so.5 /usr/local/lib/libzmq.so


ENV LOGSTASH_MAJOR 2.3
ENV LOGSTASH_VERSION 2.3.4

COPY install_logstash.sh /
COPY install_plugins.sh /

RUN /install_logstash.sh
RUN /install_plugins.sh

ENV PATH /opt/logstash/bin:$PATH

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["logstash", "agent"]
