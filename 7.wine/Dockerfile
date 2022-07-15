FROM debian

RUN mkdir /mount

RUN apt update
RUN apt upgrade -y
RUN apt install -y wine xauth

RUN useradd -ms /bin/bash guest
RUN touch /home/guest/.Xauthority

RUN dpkg --add-architecture i386 && apt-get update && apt-get install -y wine32

RUN apt autoremove -y && apt autoclean -y && apt clean -y
RUN rm -rf /var/lib/apt/list/*
