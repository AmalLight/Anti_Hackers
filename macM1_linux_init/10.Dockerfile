FROM debian

RUN cp /usr/share/zoneinfo/Europe/Rome /etc/localtime

RUN apt update && apt install -y apt-utils && apt upgrade -y

RUN apt install -y curl wget nmap ssh iputils-ping tree vim vim-tiny file

RUN apt  install -y python3 python3-pip
RUN pip3 install --upgrade pip

RUN apt autoremove -y && apt autoclean -y && apt clean -y
RUN sync && rm -rf /var/lib/apt/lists/*