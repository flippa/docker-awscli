FROM python

RUN apt-get update && apt-get install -y python-pip

RUN pip install awscli
