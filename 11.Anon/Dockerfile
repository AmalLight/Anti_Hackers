FROM debian

RUN apt update
RUN apt upgrade -y
RUN apt install -y xauth git file atril

RUN git clone https://github.com/fanglingsu/vimb.git
RUN apt install -y make pkg-config build-essential libgtk-3-dev libwebkit2gtk-4.0-dev
RUN cd vimb ; make V=1 && make install

RUN useradd -ms /bin/bash guest
RUN touch /home/guest/.Xauthority

RUN apt install -y iptables iputils-ping iproute2 curl # ping and ip a

RUN    mkdir       /myiptables
COPY ./iptables.sh /myiptables/iptables.sh
RUN    chmod   755 /myiptables/iptables.sh

RUN apt purge -y git
RUN apt autoremove -y && apt autoclean -y && apt clean -y
RUN rm -rf /var/lib/apt/list/*
