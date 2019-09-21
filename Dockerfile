FROM alpine:latest

RUN apk add --update \
  python \
  python-dev \
  py-pip \
  gcc \
  libc-dev

RUN set -ex && apk --no-cache add sudo

RUN mkdir /hx_intersight_deploy

COPY ./source/hx_intersight_deploy.py /hx_intersight_deploy
COPY ./source /hx_intersight_deploy/source

RUN rm /hx_intersight_deploy/source/hx_intersight_deploy.py

RUN tar -xf /hx_intersight_deploy/source/IntersightPythonSDK.tar.gz -C /hx_intersight_deploy/source/

RUN pip install -r /hx_intersight_deploy/source/requirements.txt

WORKDIR /hx_intersight_deploy/source/IntersightPythonSDK_v1.1

RUN python /hx_intersight_deploy/source/IntersightPythonSDK_v1.1/setup.py install

WORKDIR /hx_intersight_deploy
