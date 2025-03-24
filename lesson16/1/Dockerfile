# syntax=docker/dockerfile:1

FROM alpine:latest
RUN apk update
RUN apk add nginx
#RUN nginx
RUN mkdir -p /opt/www 
#WORKDIR 
#COPY . /opt/www
COPY index.html /opt/www
COPY default.conf /etc/nginx/http.d
#
#
EXPOSE 80
#CMD ["rc-service", "nginx", "start"]
#CMD ["nginx", "-s", "reload"]
#CMD ["nginx"]
CMD ["nginx","-g","daemon off;"]