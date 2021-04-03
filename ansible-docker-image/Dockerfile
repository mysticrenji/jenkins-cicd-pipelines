FROM python:3.8-buster
LABEL org.opencontainers.image.source https://github.com/mysticrenji/jenkins-cicd-pipelines
RUN pip install pip --upgrade
RUN pip install ansible azure-mgmt-compute azure-mgmt-network azure-mgmt-storage azure-mgmt-resource azure-storage-blob azure 

RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    sshpass

CMD ["bash"]