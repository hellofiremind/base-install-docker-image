FROM firemindltd/base-install-docker-image:latest

RUN wget "https://releases.hashicorp.com/terraform/$(curl -s https://checkpoint-api.hashicorp.com/v1/check/terraform | jq -r -M '.current_version')/terraform_$(curl -s https://checkpoint-api.hashicorp.com/v1/check/terraform | jq -r -M '.current_version')_linux_amd64.zip" &&\
 unzip terraform_*.zip &&\
 mv terraform /usr/local/bin &&\
 rm terraform_*.zip
