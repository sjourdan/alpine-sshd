NAMESPACE=sjourdan
IMAGE=alpine-sshd

.DEFAULT_GOAL := help

build:	## Build the container
	docker build -qt $(NAMESPACE)/$(IMAGE) .
	@echo "Image Built."

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
