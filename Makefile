IMAGE_NAME = ghcr.io/primary-idtech/copilot-telemetry-collector:main

.PHONY: build
build:
	docker build -t $(IMAGE_NAME) .

.PHONY: run
run:
	docker run -it --rm -p 8080:8080 -v "$(PWD)/log:/output" $(IMAGE_NAME)
