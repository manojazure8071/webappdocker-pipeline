FROM ubuntu
#RUN mkdir /opt/tomcat/
WORKDIR /opt/tomcat
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install git -y
RUN apt-get install wget -y
RUN apt-get install unzip -y
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.68/bin/apache-tomcat-9.0.68.tar.gz
RUN tar -xzf apache-tomcat-9.0.68.tar.gz
RUN mv apache-tomcat-9.0.68/* /var/lib/docker/overlay2/199779da440ad3eef975a728c341e614572e1f1b7ad4a11b4038beb924f9fe8b/diff/opt/tomcat/.
#RUN apt-get install java -y
#RUN java -version
WORKDIR /opt/tomcat/webapps
RUN wget https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.war
EXPOSE 8081
CMD ["/opt/tomcat/bin/catalina.sh","run"]
