IMAGE_NAME ?= $(shell basename $(shell pwd))

.PHONY: build
build:
	docker build -t $(IMAGE_NAME) .

.PHONY: run
run:
	docker run -it --rm -p 8080:8080 -v "$(PWD)/log:/output" $(IMAGE_NAME)
