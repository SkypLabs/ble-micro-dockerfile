#!/usr/bin/env bash

set -ev

if [ "${TRAVIS_EVENT_TYPE}" = 'push' ]; then
    if [ -n "${TRAVIS_TAG}" ]; then
        curl \
            -H "Content-Type: application/json" \
            --data "{\"source_type\": \"Tag\", \"source_name\": \"${TRAVIS_TAG}\"}" \
            -X POST https://registry.hub.docker.com/u/skyplabs/ble-micro/trigger/"${DOCKER_TRIGGER_TOKEN}"/
    else
        if [ "${TRAVIS_BRANCH}" = 'master' ]; then
            curl \
                -H "Content-Type: application/json" \
                --data '{"source_type": "Branch", "source_name": "master"}' \
                -X POST https://registry.hub.docker.com/u/skyplabs/ble-micro/trigger/"${DOCKER_TRIGGER_TOKEN}"/
        fi
    fi
fi
