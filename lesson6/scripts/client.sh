#!/bin/bash

sudo echo "client provision started!"
#ip a
mv /tmp/vagprivatekey /home/vagrant/vagprivatekey
chmod 600 vagprivatekey
echo "3"
#ssh -tt -i /home/vagrant/vagprivatekey vagrant@172.17.0.22
whoami
ssh -tt -o StrictHostKeyChecking=off -i /home/vagrant/vagprivatekey vagrant@172.17.0.22
whoami

