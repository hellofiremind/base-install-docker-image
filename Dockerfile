FROM ubuntu:19.04

MAINTAINER Charles Gillham charles.gillham@firemind.io

RUN apt-get update -y
RUN apt-get -y install wget unzip curl build-essential gcc g++ make default-jdk

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs

RUN wget https://releases.hashicorp.com/terraform/0.12.0/terraform_0.12.0_linux_amd64.zip
RUN unzip terraform_*.zip
RUN mv terraform /usr/local/bin
RUN rm terraform_*.zip


RUN which nodejs

CMD ["/bin/bash"]


