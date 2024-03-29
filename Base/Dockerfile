FROM ubuntu:20.04

MAINTAINER Charles Gillham charles.gillham@firemind.io

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && apt-get install -y gnupg2 software-properties-common wget unzip curl build-essential gcc g++ make apt-transport-https ca-certificates curl gnupg-agent software-properties-common imagemagick webp jq java-common

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
RUN add-apt-repository ppa:deadsnakes/ppa

RUN apt-get update -y && apt-get -y install default-jdk python2.7-dev python3.8-dev python3-pip docker-ce docker-ce-cli containerd.io qemu-user qemu-user-static libjpeg62 libjpeg62-dev

### Cloud SDK's
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - && apt-get update -y && apt-get install google-cloud-sdk -y
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

RUN cd /tmp && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip && ./aws/install && rm -f awscliv2.zip && rm -rf aws
COPY ./aws/config /root/.aws/config

CMD ["/bin/bash"]


