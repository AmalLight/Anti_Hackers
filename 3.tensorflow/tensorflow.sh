#!/bin/bash

sudo docker image     prune -f
sudo docker container prune -f

sudo docker image build -t tensorflow .
