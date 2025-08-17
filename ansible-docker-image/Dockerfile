FROM python:3.7.11-stretch
LABEL org.opencontainers.image.source https://github.com/mysticrenji/jenkins-cicd-pipelines
COPY requirements.txt .
RUN pip install pip --upgrade && \
    pip install -r requirements.txt

CMD ["bash"]