#!/usr/bin/env bash

wget -O - "http://download.elastic.co/logstash/logstash/logstash-$LOGSTASH_VERSION.tar.gz" | tar xfz - -C /opt
ln -s "/opt/logstash-$LOGSTASH_VERSION" /opt/logstash
