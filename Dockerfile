ARG PY_VER=3.11.3-r11
ARG ALPINE_VER=3.18

FROM alpine:{$ALPINE_VER}
ARG PY_VER

RUN apk update
RUN apk add python3=={$PY_VER} && \
    apk add py3-pip && \
    apk add git 

USER cloud_user
WORKDIR /app

RUN pip install docker-py awscli boto3 ansible --user 

CMD ['ansible --version']



