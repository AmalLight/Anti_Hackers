FROM chromiumd_base

COPY *.deb /static/

RUN apt update
RUN apt upgrade -y

RUN apt install -y libatomic1 libevent-2.1-7 libgbm1 libjsoncpp24 \
                   libminizip1 libnspr4 libnss3 libre2-9 libwebpdemux2 \
                   libwebpdemux2 libxslt1.1

RUN dpkg -i /static/chromium-common*.deb
RUN dpkg -i /static/chromium_*.deb
RUN dpkg -i /static/chromium-sandbox*.deb

RUN apt autoremove -y && apt autoclean -y && apt clean -y
RUN rm -rf /var/lib/apt/list/*
