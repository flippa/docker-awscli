PROJECT       ?= docker-awscli
REGISTRY      ?= flippa
TAG           ?= v5
IMAGE          = $(REGISTRY)/$(PROJECT):$(TAG)
LATEST         = $(REGISTRY)/$(PROJECT):latest

.PHONY: build push shell

build:
	docker build --rm -t $(IMAGE) .
	docker tag -f $(IMAGE) $(LATEST)

push:
	docker push $(IMAGE)
	docker push $(LATEST)

shell:
	docker run --rm -it \
		-e AWS_REGION \
		-e AWS_DEFAULT_REGION=${AWS_REGION} \
		-e AWS_ACCESS_KEY_ID \
		-e AWS_SECRET_ACCESS_KEY \
		$(IMAGE) bash
