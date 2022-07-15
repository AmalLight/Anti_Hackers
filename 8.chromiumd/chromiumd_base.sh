#!/bin/bash

rm -f core

sudo docker image     prune -f
sudo docker container prune -f

sudo docker image build -t chromiumd_base -f Dockerfile_base .

sudo apt install -y pulseaudio x11-utils xdg-utils xauth

sudo docker image ls
sudo docker ps --all
