#!/bin/bash

rm -f core

sudo docker image     prune -f
sudo docker container prune -f

sudo docker image build -t writer .
sudo apt install -y pulseaudio xauth

echo ' \
\
sudo docker run \
-it \
--rm \
\
-v /tmp/.X11-unix \
-v /home/$USER/.Xauthority:/home/guest/.Xauthority:ro \
\
-v /dev/shm:/dev/shm \
-v $PWD:/mount \
-w      /static \
\
-e DISPLAY \
\
--net=host        \
--user guest      \
--name writer_tmp \
\
writer bash -c " \
\
dict=0                              ; \
(( ${#@} > 0 )) && dict=$1          ; \
echo \" dictionary used : \$dict \" ; \
\
(( \$dict == 0 )) && echo Italian && libreoffice --writer dict-it.oxt ; \
(( \$dict == 1 )) && echo English && libreoffice --writer dict-en.oxt ; \
\
bash "' > ./install

echo ''
echo 'cat  INSTALL'
cat      ./install
echo ''

sudo mv ./install /usr/bin/writer
sudo chmod 755    /usr/bin/writer
                           writer
