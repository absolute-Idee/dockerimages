FROM ubuntu:20.04

RUN apt update && apt upgrade -y
RUN apt install curl -y
RUN apt install wget -y
RUN apt install iputils-ping -y
RUN apt install net-tools -y 

RUN apt install openssh-client -y


RUN apt install -y curl gnupg wget ca-certificates apt-transport-https
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list && \
    apt update && apt -y install --no-install-recommends kubectl=1.25.0-00

WORKDIR /home
RUN apt install git -y
COPY ./get_helm.sh /home
RUN chmod 700 get_helm.sh