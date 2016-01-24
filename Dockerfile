FROM ubuntu

RUN apt-get update && apt-get -y install nginx && \
    apt-get install -y supervisor && \
    apt-get install -y python3-pip && \
    pip3 install gunicorn && \
    pip3 install tornado
    
RUN apt-get install -y mysql-server

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN rm /etc/nginx/sites-enabled/default
ADD hello.conf /etc/nginx/conf.d/

ADD * /usr/
WORKDIR /usr/
RUN dpkg -i mysql-connector-python-py3_2.1.3-1ubuntu14.04_all.deb
RUN /etc/init.d/mysql start && \
    mysql < init.sql

EXPOSE 80
CMD /usr/bin/supervisord -c supervisord.conf