#!/usr/bin/env bash
set -e

docker-compose -f docker-compose.build.yml build
TEST_CUDA=1 pytest tests
