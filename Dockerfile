FROM ubuntu:19.04

MAINTAINER Charles Gillham charles.gillham@firemind.io

RUN apt-get update -y
RUN apt-get -y install wget unzip curl build-essential gcc g++ make default-jdk python2.7-dev python3.7-dev python3-pip

RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - && apt-get update -y && apt-get install google-cloud-sdk -y

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs


RUN pip3 install awscli
ENV AWS_PROFILE default


RUN wget https://releases.hashicorp.com/terraform/0.12.3/terraform_0.12.3_linux_amd64.zip
RUN unzip terraform_*.zip
RUN mv terraform /usr/local/bin
RUN rm terraform_*.zip


RUN which nodejs

CMD ["/bin/bash"]


