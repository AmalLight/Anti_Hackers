FROM python3

RUN apt autoremove -y && apt autoclean -y && apt clean -y
RUN sync && rm -rf /var/lib/apt/lists/*

RUN mkdir /Neural_Network

RUN pip3 install --upgrade pip
RUN pip3 install --default-timeout=1000 tensorflow-aarch64

# RUN pip3 install --default-timeout=1000 tensorflow