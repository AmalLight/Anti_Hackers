FROM debian

RUN apt update
RUN apt upgrade -y
RUN apt install -y apache2 systemctl

RUN mkdir -p /var/www/html
RUN mkdir -p /var/www/html/mount
RUN rm    -f /var/www/html/index.html

COPY ./run.sh       /var/www/html/run.sh
COPY ./find.sh      /var/www/html/find.sh
COPY ./Dockerfile   /var/www/html/Dockerfile
COPY ./ame.sh       /var/www/html/apacheme.sh
COPY ./linkmount.sh /var/www/html/linkmount.sh

COPY ./update2.sh      /var/www/html/update2.sh
COPY ./update2.service /var/www/html/update2.service
COPY ./update2.service /etc/systemd/system/update2.service

RUN apt autoremove -y && apt autoclean -y && apt clean -y
RUN rm -rf /var/lib/apt/list/*

RUN touch /var/log/apache2/access.log

EXPOSE 80
