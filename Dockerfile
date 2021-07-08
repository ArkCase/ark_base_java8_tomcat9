FROM 345280441424.dkr.ecr.ap-south-1.amazonaws.com/ark_base_java8:latest

RUN useradd -r -g root tomcat

ADD  https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.22/bin/apache-tomcat-9.0.22.tar.gz /tmp

RUN cd /tmp && \
    tar -xf apache-tomcat-9.0.22.tar.gz && \
    rm apache-tomcat-9.0.22.tar.gz && \
    mv apache-tomcat-9.0.22 /opt/tomcat/ && \
    chown -R tomcat: /opt/tomcat && \
    chmod +x /opt/tomcat/bin/*.sh

ENV CATALINA_HOME=/opt/tomcat/
ENV CATALINA_PID=/opt/tomcat/temp/tomcat.pid
ENV PATH=/opt/tomcat/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
# WORKDIR /opt/tomcat
USER tomcat
EXPOSE 8080







