PROJECT       ?= docker-awscli
REGISTRY      ?= quay.io/flippa
TAG           ?= v2
IMAGE          = $(REGISTRY)/$(PROJECT):$(TAG)

.PHONY: image push shell

image:
	docker build --rm -t $(IMAGE) .

push:
	docker push $(IMAGE)

shell:
	docker run --rm -it \
		-e AWS_REGION \
		-e AWS_ACCESS_KEY_ID \
		-e AWS_SECRET_ACCESS_KEY \
		$(IMAGE) bash
