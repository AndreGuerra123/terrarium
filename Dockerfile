FROM andrecatarinoguerra/kg

ENV AWS_CLI_VERSION=1.16.128 
ENV AWS_EBCLI_VERSION=3.14.3 
ENV DOCKER_COMPOSE_VERSION=1.22.0 
ENV TERRAFORM_VERSION=0.11.13 
ENV VAULT_VERSION=0.10.4 
ENV TERRAGRUNT_VERSION=v0.18.2 
ENV TWINE_VERSION=1.11.0 
ENV ECS_DEPLOY=1.4.3

#Install TERRAFORM
RUN mkdir -p /tmp/build && cd /tmp/build &&
wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && 
mkdir terraform && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d terraform && 
chmod 755 terraform &&
cp terraform/terraform /usr/local/bin/ &&
rm -rf /tmp/build

#Install TERRAGRUNT
RUN mkdir -p /tmp/build && cd /tmp/build &&
wget https://github.com/gruntwork-io/terragrunt/releases/download/${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 && 
chmod 755 terragrunt_linux_amd64 && 
cp terragrunt_linux_amd64 /usr/local/bin/terragrunt && 
rm -rf /tmp/build

#Install VAULT
RUN mkdir -p /tmp/build && cd /tmp/build && 
wget https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip && 
wget https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_SHA256SUMS && 
wget https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_SHA256SUMS.sig && 
grep vault_${VAULT_VERSION}linux_amd64.zip vault${VAULT_VERSION}SHA256SUMS | sha256sum -c && 
unzip -d /bin vault${VAULT_VERSION}_linux_amd64.zip && 
rm -rf /tmp/build

#Install AWS_CLI

#Install AWS_EB_CLI

#Install AWS_ECB_DEPLOY

#Install DOCKER_COMPOSE


