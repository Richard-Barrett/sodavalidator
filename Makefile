MKFILE_DIR := $(abspath $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST))))))
IMAGE_NAME ?= irhythm/sodavalidator
IMAGE_TAG ?= latest
IMAGE_RELEASE ?= latest_$(RELEASE)
BRANCH ?= $(git rev-parse --symbolic --abbrev-ref HEAD)
PROJECT ?= sodavalidator
RELEASE ?= $(git tag --sort=committerdate | tail -1)
MOD_PATH := github.com/Richard-Barrett/sodavalidator
DOCKER_FLAGS := -v $(MKFILE_DIR)

# Make Container Build
.PHONY: build
build:
	docker build ${MKFILE_DIR} -t ${IMAGE_NAME}:${IMAGE_TAG}

# Make Container with tty terminal into /bin/bash
.PHONY: container
container:
	docker run --rm -it --entrypoint /bin/bash ${IMAGE_NAME}

# Make Docker Push on Tagged Image
.PHONY: push
push:
	docker image push ${IMAGE_NAME}:${BRANCH}_${RELEASE}

# Make Container Tag
.PHONY: tag
tag:
	docker tag $(IMAGE_NAME):$(IMAGE_TAG) $(IMAGE_NAME):$(BRANCH)_$(RELEASE)

# Make Container Tag Latest
.PHONY: latest
latest:
	docker tag $(IMAGE_NAME):$(IMAGE_TAG) $(IMAGE_NAME):latest
