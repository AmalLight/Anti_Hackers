#!/bin/bash

source /var/root/.jenkins/CommonFiles/2.common.sh
source $common/5.path.sh

docker image list
docker ps   --all

imgs=(`sudo docker images --filter "dangling=true" --quiet --no-trunc`)

for img in ${imgs[@]} ; do sudo docker rmi $img ; done

docker image     prune -f
docker container prune -f

docker image build -f $common/10.Dockerfile -t python3 .