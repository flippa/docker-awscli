FROM alpine:3.4

ENV BUILD_PACKAGES bash curl-dev ruby-dev build-base
ENV RUBY_PACKAGES ruby ruby-bundler
ENV PYTHON_PACKAGES python python-dev py-pip

RUN apk update && \
    apk upgrade && \
    apk add $BUILD_PACKAGES && \
    apk add $RUBY_PACKAGES && \
    apk add $PYTHON_PACKAGES && \
    rm -rf /var/cache/apk/*

RUN gem install --no-ri --no-rdoc cfoo
RUN pip install awscli
