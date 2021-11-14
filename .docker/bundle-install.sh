#!/bin/bash

export BUNDLER_VERSION=2.2.29
gem install bundler -v "$BUNDLER_VERSION"

if [[ "$RAILS_ENV" == "production" ]]; then \
    bundle install --jobs `expr $(cat /proc/cpuinfo | grep -c "cpu cores") - 1` --retry 3 --without development test; \
else \
    bundle install --jobs `expr $(cat /proc/cpuinfo | grep -c "cpu cores") - 1` --retry 3; \
fi