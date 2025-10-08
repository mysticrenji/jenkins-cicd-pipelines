FROM python:3.14-slim
LABEL org.opencontainers.image.source https://github.com/mysticrenji/flask-mysql-k3s
COPY src/requirements.txt .
RUN apt-get update \
    && apt-get install -y default-libmysqlclient-dev build-essential \
    && pip install -r requirements.txt 
    
RUN mkdir /code
COPY src /code
WORKDIR /code
EXPOSE 80
ENTRYPOINT ["python", "app.py"]



     
