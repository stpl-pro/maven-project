#git
FROM alpine/git as repo

MAINTAINER devopstrainingblr@gmail.com

WORKDIR /app
RUN git clone https://github.com/stpl-pro/maven-project.git

#Maven
FROM maven:3.5-jdk-8-alpine as build
WORKDIR /app
COPY --from=repo /app/maven-web-application  /app 
RUN mvn install

#Tomcat
FROM tomcat:8.0.20-jre8
COPY --from=build /app/target/maven-web-application*.war /usr/local/tomcat/webapps/maven-web-application.war
