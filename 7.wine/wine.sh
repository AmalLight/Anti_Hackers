#!/bin/bash

sudo docker image     prune -f
sudo docker container prune -f

sudo docker image build -t wine .

echo ''
echo '-------------------BIN'

sudo apt install -y xauth

echo ' \
\
sudo docker run \
-it \
--rm \
\
-v /tmp/.X11-unix \
-v /home/$USER/.Xauthority:/home/guest/.Xauthority:ro \
-v $PWD:/mount \
-w /mount \
\
-e DISPLAY   \
--user guest \
--net=host   \
\
--name wine_tmp \
\
wine sh -c " \
\
xauth list ; \
\
bash "' > ./install

echo ''
echo 'cat  INSTALL'
cat      ./install
echo ''

sudo mv ./install /usr/bin/wine
sudo chmod 755    /usr/bin/wine

wine
