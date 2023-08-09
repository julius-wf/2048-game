FROM ubuntu:22.04                       


RUN apt-get update                      # update
RUN apt-get install -y zip curl nginx   # Download nessary tools 


RUN echo "daemon off;" >> /etc/nginx/nginx.conf     #Edit nginx.conf
RUN curl -o /var/www/html/2048-master.zip -L https://github.com/gabrielecirulli/2048/archive/refs/heads/master.zip
RUN cd /var/www/html/ && unzip 2048-master.zip && mv 2048-master/* . && rm -f 2048-master.zip

EXPOSE 80

CMD ["usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf"]
