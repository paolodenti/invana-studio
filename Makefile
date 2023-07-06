platforms = linux/amd64,linux/arm64/v8

ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

.PHONY: build-prepare
build-prepare:
	docker buildx create --platform ${platforms} --use

.PHONY: build
build:
	@cd $(ROOT_DIR) && \
docker buildx build \
  --push \
  --platform ${platforms} \
  -t paolodenti/invana-studio:latest \
  .
