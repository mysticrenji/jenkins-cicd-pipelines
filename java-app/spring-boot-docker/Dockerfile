FROM adoptopenjdk/openjdk11:alpine-jre
ARG JAR_FILE=target/*.jar
LABEL org.opencontainers.image.source https://github.com/mysticrenji/jenkins-cicd-pipelines
COPY ${JAR_FILE} application.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/application.jar"]
