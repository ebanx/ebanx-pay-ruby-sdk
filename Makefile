INTEGRATION_KEY ?= <integration_key>
DOCKER_IMAGE_NAME ?= ebanx_ruby

test:
	docker run -it -e "INTEGRATION_KEY=$(INTEGRATION_KEY)" -v `pwd`:"/usr/src/ebanx-ruby"  --network host $(DOCKER_IMAGE_NAME):latest rake test

build:
	docker build -t "$(DOCKER_IMAGE_NAME):latest" .

.PHONY: test build