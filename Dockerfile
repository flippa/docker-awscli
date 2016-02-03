FROM gliderlabs/alpine:3.3

RUN apk --no-cache add \
      bash \
      python \
      py-pip

RUN pip install awscli
