#!/usr/bin/env bash
set -e

docker build . \
  -t codeblick/wraith \
  -q
