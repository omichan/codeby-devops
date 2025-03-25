# syntax=docker/dockerfile:1

FROM debian:11
RUN apt update
RUN apt install -y nginx
#RUN ufw allow 'Nginx HTTP'
RUN mkdir -p /opt/www 
COPY index.html /opt/www
COPY default /etc/nginx/sites-available
EXPOSE 80
ENTRYPOINT ["/usr/sbin/nginx","-g","daemon off;"]