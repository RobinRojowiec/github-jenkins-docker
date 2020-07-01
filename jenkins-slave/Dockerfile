# © Copyright IBM Corporation 2019, 2020.
# LICENSE: Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0)

################ Dockerfile for Jenkins JNLP Slave version 3.40 ###################
#
# This Dockerfile builds an image for Jenkins slave node.
#
# This is an image for Jenkins agent (FKA "slave") using JNLP to establish connection. This agent is powered by the Jenkins Remoting library,
# which version is being taken from the base Docker Agent image.
#
# To build this image, from the directory containing this Dockerfile
# (assuming that the file is named Dockerfile):
# docker build -t <image_name> .
#
# To start Jenkins slave, create a container from the created image
#
# docker run <image-name> -url http://<jenkins-server>:port <secret> <agent name>
#
#
##################################################################################

# Base image
FROM ubuntu:18.04

# The Author
ARG VERSION=3.40
ARG user=jenkins
ARG group=jenkins
ARG uid=1000
ARG gid=1000


# Set Environment Variables
ENV HOME /home/${user}
#ENV JAVA_HOME=/usr/share/jdk8u242-b08
#ENV PATH=$JAVA_HOME/bin:$PATH

# Install dependencies
RUN apt-get update && apt install default-jdk -y 

LABEL Description="This is a base image, which provides the Jenkins agent executable (slave.jar)" Vendor="Jenkins project" Version="${VERSION}"

ARG AGENT_WORKDIR=/home/${user}/agent

# Copy Jenkins agent.jar
COPY agent.jar /usr/share/jenkins/agent.jar
RUN chmod 755 /usr/share/jenkins \
  && chmod 644 /usr/share/jenkins/agent.jar

# Download JNLP jenkins agent script
RUN apt install curl -y
RUN curl -o /usr/local/bin/jenkins-agent https://raw.githubusercontent.com/jenkinsci/docker-jnlp-slave/3.40-1/jenkins-agent \
  && chmod 755 /usr/local/bin/jenkins-agent \
  && ln -fs /usr/local/bin/jenkins-agent /usr/local/bin/jenkins-slave

#-> tools
RUN apt-get update
RUN apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common -y


# install libraries
# -> git
RUN apt-get install git -y

# -> install python
RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip

#-> ansible
RUN apt-add-repository ppa:ansible/ansible
RUN apt-get update
RUN apt-get install ansible -y 

# -> docker
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
RUN apt-get update 
RUN apt-get install docker-ce -y

# -> nodejs
RUN apt-get install nodejs -y
RUN apt-get install npm -y
RUN npm install -g npm@latest

ENV AGENT_WORKDIR=${AGENT_WORKDIR}

RUN mkdir /home/${user}/.jenkins && mkdir -p ${AGENT_WORKDIR}

WORKDIR /home/${user}

# Run JNLP jenkins agent script
ENTRYPOINT ["/usr/local/bin/jenkins-agent"]