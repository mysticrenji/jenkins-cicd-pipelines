FROM ubuntu:18.04
RUN apt update && apt install -y curl jq wget unzip ca-certificates gnupg lsb-release apt-transport-https 

# Install Azure CLI
COPY azure-cupi.pub /root/.ssh/azure-cupi.pub
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash
RUN curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null
RUN AZ_REPO=$(lsb_release -cs) && echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | tee /etc/apt/sources.list.d/azure-cli.list
RUN apt update && apt install -y azure-cli

# Install Terraform
ARG TERRAFORM_VERSION="0.13.0"
RUN cd /tmp && \
    wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin && \
    rm -rf /tmp/* && \
    rm -rf /var/cache/apk/* && \
    rm -rf /var/tmp/*

CMD ["bash"]