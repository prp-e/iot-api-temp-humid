FROM ruby:2.3-onbuild 

RUN apt-get update 
RUN apt-get install -y mongodb mongodb-server mongodb-dev 
RUN echo "MongoDB Installed Successfully"

RUN mkdir -pv /usr/src/api
ADD . /usr/src/api
WORKDIR /usr/src/api

CMD ["ruby", "/usr/src/api/main.rb", "-p", "4040"]
