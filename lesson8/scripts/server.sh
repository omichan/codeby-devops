#!/bin/bash

#sudo echo "server!!"
#ip a
#sudo rm /etc/apk/repositories
#sudo touch /etc/apk/repositories

sudo echo "http://dl-cdn.alpinelinux.org/alpine/v3.7/main" | sudo tee /etc/apk/repositories
sudo echo "http://dl-cdn.alpinelinux.org/alpine/v3.7/community" | sudo tee -a /etc/apk/repositories

sudo apk update
sudo apk upgrade
sudo apk add apache2-ssl
sudo apk add openssl
# generate cert files
openssl req -newkey rsa:2048 -nodes -keyout server.key -x509 -days 365 -out server.crt -subj "/C=XX/ST=vagrantST/L=vagrantL/O=vagrantO/OU=vagrantOU/CN=less8.local"

#sudo apk add apache2
sudo mkdir /etc/apache2/ssl
sudo cp server.crt /etc/apache2/ssl/server.crt
sudo cp server.key /etc/apache2/ssl/server.key

# add apache2 config
sudo tee -a /etc/apache2/httpd.conf > /dev/null <<EOT
	<VirtualHost *:443>
		DocumentRoot "/var/www/localhost/htdocs/"
		ServerName less8.local
		SSLEngine on
			SSLCertificateFile "/etc/apache2/ssl/server.crt"
			SSLCertificateKeyFile "/etc/apache2/ssl/server.key"
	</VirtualHost>

	<VirtualHost *:80>
	   ServerName www.less8.local
	   Redirect permanent / http://less8.local/
	</VirtualHost>

	<VirtualHost *:80>
	   ServerName less8.local
	   Redirect permanent / https://less8.local/
	</VirtualHost>
EOT

sudo rc-service apache2 restart
mv /tmp/vagprivatekey /home/vagrant/vagprivatekey
chmod 600 vagprivatekey

scp -o StrictHostKeyChecking=off -i /home/vagrant/vagprivatekey -r /home/vagrant/server.crt vagrant@172.17.0.21:/home/vagrant
