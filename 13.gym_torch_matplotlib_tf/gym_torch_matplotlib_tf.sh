#!/bin/bash

sudo docker image     prune -f
sudo docker container prune -f

sudo docker image build -t gym_torch_matplotlib_tf .
