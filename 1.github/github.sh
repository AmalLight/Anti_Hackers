#!/bin/bash

sudo docker image     prune -f
sudo docker container prune -f

cp /home/kaumi/Git/public/bash/gitinit.sh ./init.sh
sync

sudo docker image build -t github .

echo ''
echo '-------------------BIN'

github_folders=(`  find /home/$USER -name ".*" -prune -o -print | grep Git                      `)
github_folder=$github_folders

ssh_key_folders=(` find /home/$USER -name ".*" -prune -o -print | grep ssh_key | grep -v backup `)
ssh_key_folder=$ssh_key_folders

echo "github_folders: $github_folders"
echo "ssh_key_folder: $ssh_key_folder"

echo "sudo chown kaumi -R $github_folder"      > ./install
echo "sudo chmod 755   -R $github_folder"     >> ./install
echo "sudo rm -f $ssh_key_folder/known_hosts" >> ./install

echo "sudo docker run \
\
-it \
--rm \
\
--name github_tmp \
\
-v $github_folder:/Git \
-v $ssh_key_folder:/root/.ssh \
-w /Git/ \
\
github sh -c ' \
\
timeout 4 ping deb.debian.org ; \
eval \`ssh-agent -s\` ; \
ssh-add ; \
ssh -T git@github.com ; \
\
bash '" >> ./install

echo ''
echo 'cat INSTALL'
cat ./install
echo ''

sudo mv ./install /usr/bin/github
sudo chmod 755    /usr/bin/github

github
