FROM python3

RUN mkdir /mount

RUN apt update
RUN apt upgrade -y
RUN apt install -y jupyter
RUN pip3 install --upgrade pip

RUN echo 'echo "file: $1" ; jupyter nbconvert --to script $1' > /usr/bin/nbconvert
RUN chmod 777                                                   /usr/bin/nbconvert

RUN apt autoremove -y && apt autoclean -y && apt clean -y
RUN sync && rm -rf /var/lib/apt/lists/*
