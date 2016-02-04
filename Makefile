PROJECT       ?= docker-awscli
REGISTRY      ?= flippa
TAG           ?= v4
IMAGE          = $(REGISTRY)/$(PROJECT):$(TAG)
LATEST         = $(REGISTRY)/$(PROJECT):latest

.PHONY: image push shell

image:
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
