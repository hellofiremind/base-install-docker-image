FROM firemindltd/base-install-docker-image-base:latest

# Install Node.JS
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && apt-get install -y nodejs

# Install Terraform
RUN wget "https://releases.hashicorp.com/terraform/$(curl -s https://checkpoint-api.hashicorp.com/v1/check/terraform | jq -r -M '.current_version')/terraform_$(curl -s https://checkpoint-api.hashicorp.com/v1/check/terraform | jq -r -M '.current_version')_linux_amd64.zip" &&\
 unzip terraform_*.zip &&\
 mv terraform /usr/local/bin &&\
 rm terraform_*.zip

### Java
RUN wget https://corretto.aws/downloads/latest/amazon-corretto-8-x64-linux-jdk.deb && apt install -y ./amazon-corretto-8-x64-linux-jdk.deb && rm -f ./amazon-corretto-11-x64-linux-jdk.deb
RUN wget https://corretto.aws/downloads/latest/amazon-corretto-11-x64-linux-jdk.deb && apt install -y ./amazon-corretto-11-x64-linux-jdk.deb && rm -f ./amazon-corretto-11-x64-linux-jdk.deb
