FROM mcr.microsoft.com/azure-cli
LABEL org.opencontainers.image.source https://github.com/mysticrenji/jenkins-cicd-pipelines
COPY requirements.txt .
RUN pip install pip --upgrade && \
    pip install -r requirements.txt

RUN apk add --no-cache bash openssh sshpass

CMD ["bash"]