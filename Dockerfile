FROM centos:7

RUN yum -y update && \
    yum -y install java-1.8.0-openjdk

ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.292.b10-1.el7_9.x86_64

ENV JRE_HOME /usr/lib/jvm/jre

RUN useradd -r -g root tomcat


ADD  http://apache.cs.utah.edu/tomcat/tomcat-9/v9.0.46/bin/apache-tomcat-9.0.46.tar.gz /tmp

RUN cd /tmp && \
    tar -xf apache-tomcat-9.0.46.tar.gz && \
    mv apache-tomcat-9.0.46 /opt/tomcat/ && \
    chown -R tomcat: /opt/tomcat && \
    sh -c 'chmod +x /opt/tomcat/bin/*.sh'

ENV CATALINA_HOME /opt/tomcat/
ENV CATALINA_PID /opt/tomcat/temp/tomcat.pid
ENV PATH=/opt/tomcat/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
# WORKDIR /opt/tomcat
USER tomcat
EXPOSE 8080
CMD ["/bin/bash"]
# CMD ["catalina.sh","run"]






