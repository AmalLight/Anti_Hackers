FROM gym_torch_matplotlib

RUN apt update        && apt upgrade   -y
RUN apt autoremove -y && apt autoclean -y && apt clean -y
RUN sync && rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip
RUN pip3 install --default-timeout=1000 tensorflow-aarch64
