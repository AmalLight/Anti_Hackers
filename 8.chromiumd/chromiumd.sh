#!/bin/bash

rm -f core

sudo docker image     prune -f
sudo docker container prune -f

sudo docker image build -t chromiumd .
sudo apt install -y pulseaudio xauth

echo ' \
\
sudo docker run \
-it \
--rm \
\
-v /tmp/.X11-unix \
-v /run/user/$UID/pulse:/run/user/1000/pulse \
-v /home/$USER/.Xauthority:/home/guest/.Xauthority:ro \
\
--device /dev/video0 \
-v /dev/shm:/dev/shm \
\
-v $PWD:/mount \
-w      /mount \
\
-e DISPLAY \
\
--net=host           \
--user guest         \
--name chromiumd_tmp \
\
chromiumd sh -c " \
chromium --no-sandbox https://www.onlinemictest.com/sound-test/ ; \
bash ; \
\
"' > ./install

echo ''
echo 'cat  INSTALL'
cat      ./install
echo ''

sudo mv ./install /usr/bin/chromiumd
sudo chmod 755    /usr/bin/chromiumd
                           chromiumd
