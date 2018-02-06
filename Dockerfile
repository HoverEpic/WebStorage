FROM edyan/apache:2.4-slim

RUN apk add --update \
    apache2-utils \
    python \
    python-dev \
    py-pip \
    build-base \
  && pip install virtualenv \
  && rm -rf /var/cache/apk/*

ADD files/etc /etc
ADD files/var /var
ADD files/run.sh /run.sh