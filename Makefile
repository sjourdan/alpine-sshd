NAMESPACE=sjourdan
IMAGE=alpine-sshd

build:
	docker build -t $(NAMESPACE)/$(IMAGE) .
