FROM ubuntu

MAINTAINER DeanXu

RUN apt-get update &&\
    apt-get install -y nginx &&\
    apt-get install -y software-properties-common &&\
    add-apt-repository ppa:ondrej/php &&\
    apt-get update &&\
