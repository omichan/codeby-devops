#!/bin/bash

sudo echo "client provision started!"
#ip a
#echo "1"
#mv /tmp/vagprivatekey /home/vagrant/vagprivatekey
#echo "2"
#chmod 600 vagprivatekey
#echo "3"
#ssh -tt -i /home/vagrant/vagprivatekey vagrant@172.17.0.22
#ssh -tt -i /home/vagrant/vagprivatekey vagrant@172.17.0.22
#whoami
#ssh -tt -o StrictHostKeyChecking=off -i /home/vagrant/vagprivatekey vagrant@172.17.0.22
#whoami
#ssh-keygen -t rsa -b 1024 -f ~/.ssh/auth_key -q -N ""
#ssh -i ~/.ssh/auth_key vagrant@172.17.0.22

sudo echo "http://dl-cdn.alpinelinux.org/alpine/v3.7/main" | sudo tee /etc/apk/repositories
sudo echo "http://dl-cdn.alpinelinux.org/alpine/v3.7/community" | sudo tee -a /etc/apk/repositories

sudo apk update
sudo apk upgrade
sudo apk add curl

#openssl req -newkey rsa:2048 -nodes -keyout domain.key -new -out domain.csr -subj "/C=XX/ST=StateName/L=CityName/O=CompanyName/OU=CompanySectionName/CN=less8.local"
# create self-signed cert
#openssl req -newkey rsa:2048 -nodes -keyout server.key -x509 -days 365 -out server.crt -subj "/C=XX/ST=vagrantST/L=vagrantL/O=vagrantO/OU=vagrantOU/CN=less8.local"

sudo echo "172.17.0.22     less8.local" | sudo tee -a /etc/hosts
sudo echo "172.17.0.22     www.less8.local" | sudo tee -a /etc/hosts

curl https://less8.local/
#sudo chmod 600 /home/vagrant/.ssh/privkey
#scp -C -o StrictHostKeyChecking=off -i /home/vagrant/privkey -r /home/vagrant/test vagrant@172.17.0.22:/home/vagrant


sudo cp server.crt /usr/local/share/ca-certificates/less8.local
sudo update-ca-certificates

curl https://less8.local/