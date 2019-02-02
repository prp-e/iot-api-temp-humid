FROM ruby:2.3-onbuild 

apt-get update 
apt-get install -y mongodb mongodb-server mongodb-dev 
echo "MongoDB Installed Successfully"