#!/bin/bash

sudo docker image     prune -f
sudo docker container prune -f

sudo docker image build -t anon .

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
\
-e DISPLAY \
\
--net=host          \
--cap-add=NET_ADMIN \
--user root         \
--name anon_tmp     \
\
anon sh -c " \
\
bash /myiptables/iptables.sh ; \
\
ip a ; \
\
iptables-legacy  -L  -v  -n  ; \
\
su guest -c vimb ; \
\
bash ; \
\
iptables-legacy -F ; "' > ./install

echo ''
echo 'cat  INSTALL'
cat      ./install
echo ''

sudo mv ./install /usr/bin/anon
sudo chmod 755    /usr/bin/anon

anon
