FROM ubuntu:22.04

RUN apt update && apt upgrade -y
RUN apt install python3 -y && apt install python3-pip -y
RUN python3 -m pip install --upgrade pip
RUN apt install ansible -y

WORKDIR /home
RUN apt install git -y
COPY ./get_helm.sh /home
RUN chmod 700 get_helm.sh
RUN /home/get_helm.sh