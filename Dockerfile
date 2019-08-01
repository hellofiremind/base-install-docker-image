FROM ubuntu:19.04

MAINTAINER Charles Gillham charles.gillham@firemind.io

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y
RUN apt-get install -y gnupg2 software-properties-common wget unzip curl build-essential gcc g++ make apt-transport-https ca-certificates curl gnupg-agent software-properties-common imagemagick

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 # R Repository
RUN add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu disco-cran35/' # R Repo
RUN add-apt-repository ppa:linuxuprising/java # Java Repo
RUN apt-get update -y
RUN apt-get -y install default-jdk python2.7-dev python3.7-dev python3-pip r-base docker-ce docker-ce-cli containerd.io qemu-user qemu-user-static

RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - && apt-get update -y && apt-get install google-cloud-sdk -y

RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs

RUN apt-get install -y libjpeg62 libjpeg62-dev

RUN pip3 install awscli

RUN wget https://releases.hashicorp.com/terraform/0.12.3/terraform_0.12.3_linux_amd64.zip
RUN unzip terraform_*.zip
RUN mv terraform /usr/local/bin
RUN rm terraform_*.zip

ENV AWS_PROFILE default

CMD ["/bin/bash"]


