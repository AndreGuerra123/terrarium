FROM andrecatarinoguerra/kg:latest

ENV TERRAFORM_VERSION=0.12.1
ENV TERRAGRUNT_VERSION=v0.18.7
ENV VAULT_VERSION=1.1.2
ENV AWS_CLI_VERSION=1.16.172
ENV AWS_EBCLI_VERSION=3.15.2
ENV DOCKER_COMPOSE_VERSION=1.22.0
ENV ECS_DEPLOY_VERSION=1.7.0

# Setup
RUN mkdir -p /tmp/build && cd /tmp/build
RUN apk --no-cache --upgrade add python3 git jq docker && \
    python3 --version && \
    git --version && \
    jq --version && \
    docker --version

RUN pip3 install --upgrade pip

#Install TERRAFORM
RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    mkdir terraform && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d terraform && \
    chmod 755 terraform && \
    cp terraform/terraform /usr/local/bin/ && \
    terraform --version

#Install TERRAGRUNT
RUN wget https://github.com/gruntwork-io/terragrunt/releases/download/${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 && \
    chmod 755 terragrunt_linux_amd64 && \
    cp terragrunt_linux_amd64 /usr/local/bin/terragrunt && \
    terragrunt --version

#Install VAULT
RUN wget https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip && \
    unzip -d /usr/local/bin vault_${VAULT_VERSION}_linux_amd64.zip && \
    vault --version

#Install ECS_DEPLOY
RUN pip3 --no-cache-dir install ecs-deploy==${ECS_DEPLOY_VERSION} && \
    ecs --version

#Install AWS_CLI_VERSION
RUN pip3 --no-cache-dir install awscli==${AWS_CLI_VERSION} && \
    aws --version

#Install DOCKER_COMPOSE
RUN pip3 --no-cache-dir install docker-compose==${DOCKER_COMPOSE_VERSION} && \
    docker-compose --version

#Install AWS_EB_CLI
RUN pip3 --no-cache-dir install awsebcli==${AWS_EBCLI_VERSION} && \
    eb --version


#Clean UP
RUN rm -rf /tmp/build

