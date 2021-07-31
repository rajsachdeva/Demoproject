FROM ubuntu:latest

WORKDIR /app

COPY . /app

RUN apt-get update && apt-get install -y

RUN apt-get install default-jdk -y

RUN apt-get install unzip zip -y

RUN curl -s https://get.sdkman.io | bash

RUN source ~/.sdkman/bin/sdkman-init.sh

RUN sdk install springboot

RUN apt-get install maven -y

RUN mvn clean install

RUN cd target/

RUN java -jar SpringProject-0.0.1-SNAPSHOT.jar

EXPOSE 8080