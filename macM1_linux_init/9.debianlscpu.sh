#!/bin/bash

source /var/root/.jenkins/CommonFiles/5.path.sh

docker pull debian

docker image list

docker run --rm --name debian_tmp debian lscpu