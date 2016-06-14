#!/usr/bin/env bash

PLUGINS="$PLUGINS logstash-input-beats"

for plugin in $PLUGINS
do
  /opt/logstash/bin/logstash-plugin install $plugin
done

