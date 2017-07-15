FROM ubuntu:14.04

RUN apt-get update && apt-get -y install nginx && \
    apt-get install -y supervisor && \
    apt-get install -y python3-pip && \
    pip3 install gunicorn && \
    pip3 install tornado
    
RUN apt-get install -y mysql-server

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN rm /etc/nginx/sites-enabled/default
COPY hello.conf /etc/nginx/conf.d/

RUN mkdir -p /var/log/supervisor

COPY . /usr/
WORKDIR /usr/
RUN dpkg -i mysql-connector-python-py3_2.1.3-1ubuntu14.04_all.deb

EXPOSE 80
CMD ['chmod +x ./hello.sh']
CMD ['./hello.sh']
