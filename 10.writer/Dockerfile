FROM debian

COPY *.oxt /static/

RUN apt update
RUN apt upgrade -y
RUN apt install -y xauth libreoffice-writer

RUN useradd -ms /bin/bash guest
RUN touch /home/guest/.Xauthority

RUN apt autoremove -y && apt autoclean -y && apt clean -y
RUN rm -rf /var/lib/apt/list/*