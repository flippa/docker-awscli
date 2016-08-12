FROM ruby:2.3.1

RUN apt-get update && \
    apt-get install -y \
    python \
    python-setuptools \
    python-dev \
    build-essential
RUN easy_install pip

RUN pip install awscli
RUN gem install cfoo
