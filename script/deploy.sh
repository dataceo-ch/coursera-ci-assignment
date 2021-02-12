#!/usr/bin/env bash
set -e

DOCKER_REPO=coursera-ci-assignment

./gradlew -p ./monolithic/ui packageToContainer
echo ${DOCKER_PASSWORD}|docker login --username ${DOCKER_LOGIN} --password-stdin
docker tag zutherb/monolithic-shop:latest ${DOCKER_LOGIN}/${DOCKER_REPO}:latest
docker push ${DOCKER_LOGIN}/${DOCKER_REPO}:latest
