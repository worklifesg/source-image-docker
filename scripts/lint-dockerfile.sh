#!/bin/bash
# Requires hadolint installed
docker run --rm -i hadolint/hadolint < src/Dockerfile
