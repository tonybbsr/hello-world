FROM tomcat:latest
#FROM tomcat:8.0-alpine
LABEL maintainer="tonybbsr@gmail.com"
COPY /webapp/target/*.war /usr/local/tomcat/webapps
EXPOSE 8080
CMD ["catalina.sh", "run"]
