FROM python3

RUN apt update && apt upgrade -y
RUN apt               install -y swig
RUN apt autoremove -y && apt autoclean -y && apt clean -y
RUN sync && rm -rf /var/lib/apt/lists/*

RUN mkdir /Neural_Network

RUN pip3 install --upgrade pip
RUN pip3 install --default-timeout=1000 numpy gym gym[box2d] torch matplotlib box2d-py
