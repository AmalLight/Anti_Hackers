FROM github

RUN apt purge -y git*

RUN apt update
RUN apt upgrade -y

RUN apt  install -y python3 python3-pip
RUN pip3 install --upgrade pip

RUN apt autoremove -y && apt autoclean -y && apt clean -y
RUN sync && rm -rf /var/lib/apt/lists/*