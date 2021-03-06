#!/bin/bash

if [ -n "$MAX_INDEX_AGE" ] && [ -z "$USE_SSL" ]; then
  /usr/bin/curator --host $ELASTICSEARCH_HOST --port $ELASTICSEARCH_PORT delete indices --older-than $MAX_INDEX_AGE --time-unit days --prefix logstash  --timestring '%Y.%m.%d'
elif [ -n "$MAX_INDEX_AGE" ] && [ -n "$USE_SSL" ]; then
  /usr/bin/curator --host $ELASTICSEARCH_HOST --port $ELASTICSEARCH_PORT --use_ssl delete indices --older-than $MAX_INDEX_AGE --time-unit days --prefix logstash  --timestring '%Y.%m.%d'
else
  echo "Skip purging old indices. MAX_INDEX_AGE is not set."
fi
