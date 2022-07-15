FROM debian

RUN cp /usr/share/zoneinfo/Europe/Rome /etc/localtime

RUN mkdir /Git
RUN mkdir /root/.ssh

COPY ./init.sh /usr/bin/gitinit

RUN apt update && apt install -y apt-utils && apt upgrade -y

RUN apt install -y curl wget nmap git ssh iputils-ping tree vim vim-tiny file

RUN sync && rm -rf /root/.ssh/*
RUN apt autoremove -y && apt autoclean -y && apt clean -y
RUN sync && rm -rf /var/lib/apt/lists/*

RUN git config --global init.defaultBranch main
RUN git config --global user.email ilovenewblood@gmail.com
RUN git config --global user.name  AmalLight

RUN git config --global pull.rebase true
