FROM gliderlabs/alpine:3.2

RUN apk --update add \
      bash \
      python \
      py-pip

RUN pip install awscli
