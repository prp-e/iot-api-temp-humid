FROM ruby:2.3-onbuild 

RUN apt-get update 
RUN apt-get install -y mongodb mongodb-server mongodb-dev 
RUN echo "MongoDB Installed Successfully"