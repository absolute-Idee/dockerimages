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

RUN apt-get install -y gnupg2
RUN sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt focal-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 7FCC7D46ACCC4CF8

RUN apt update && apt upgrade -y

RUN apt -y install postgresql-15
RUN service postgresql start

EXPOSE 5432
CMD ["postgres"]

COPY . /home/root/ 
#Copying script file
USER root 
