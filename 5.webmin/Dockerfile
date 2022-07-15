FROM debian

RUN apt update
RUN mkdir /sharing

RUN apt install -y tzdata
RUN dpkg-reconfigure --frontend noninteractive tzdata

RUN apt upgrade -y
RUN apt install -y perl libnet-ssleay-perl openssl libauthen-pam-perl wget
RUN apt install -y libpam-runtime libio-pty-perl python unzip curl imagemagick
RUN apt install -y shared-mime-info

RUN wget http://prdownloads.sourceforge.net/webadmin/webmin_1.991_all.deb

RUN dpkg -i webmin_1.991_all.deb

RUN apt autoremove -y && apt autoclean -y && apt clean -y
RUN rm -rf /var/lib/apt/list/*

RUN touch /var/webmin/minserv.log
RUN echo root:root | chpasswd

EXPOSE 10000
