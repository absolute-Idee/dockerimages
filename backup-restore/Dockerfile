FROM ubuntu:20.04

RUN apt update && apt upgrade -y
RUN apt install curl -y
RUN apt install wget -y

# RUN curl -k https://dl.min.io/client/mc/release/linux-amd64/mc \
#   --create-dirs \
#   -o $HOME/minio-binaries/mc

# RUN chmod +x $HOME/minio-binaries/mc
# RUN export PATH=$PATH:$HOME/minio-binaries/

# ENTRYPOINT ["export PATH=$PATH:$HOME/minio-binaries/", "mc --help"]

ARG TZ=Europe/Moscow
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get -y install postgresql 
RUN service postgresql start

EXPOSE 5432
CMD ["postgres"]

#Make sure that your shell script file is in the same folder as your dockerfile while running the docker build command as the below command will copy the file to the /home/root/ folder for execution. 
COPY . /home/root/ 
#Copying script file
USER root 
