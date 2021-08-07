FROM ubuntu:latest

WORKDIR /app

COPY . /app

RUN apt-get update && apt-get install -y

RUN apt-get -qq -y install curl wget unzip zip default-jdk

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN curl -s https://get.sdkman.io | bash

RUN source ~/.sdkman/bin/sdkman-init.sh \
    && sdk install springboot

RUN apt-get install maven -y

RUN mvn clean install

ENTRYPOINT ["java","-jar","/app/target/SpringProject-0.0.1-SNAPSHOT.jar"]

EXPOSE 8080
