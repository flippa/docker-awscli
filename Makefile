PROJECT       ?= docker-awscli
REGISTRY      ?= flippa
TAG           ?= v6
IMAGE          = $(REGISTRY)/$(PROJECT):$(TAG)

.PHONY: build push shell

build:
	docker build --rm -t $(IMAGE) .

push:
	docker push $(IMAGE)

shell:
	docker run --rm -it \
		-e AWS_REGION \
		-e AWS_DEFAULT_REGION=${AWS_REGION} \
		-e AWS_ACCESS_KEY_ID \
		-e AWS_SECRET_ACCESS_KEY \
		$(IMAGE) bash
