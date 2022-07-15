#!/bin/bash

sudo docker image     prune -f
sudo docker container prune -f

sudo docker image build -t jupyter .

echo ''
echo '-------------------BIN'

echo "sudo docker run \
\
--rm \
\
--name jupyter_tmp \
\
-v \$PWD:/mount \
-w /mount \
\
jupyter sh -c \" \
\
echo 'path: \$1' ; \
\
echo 'cd \$1' ; \
      cd \$1  ; \
echo 'ls   .' ; \
      ls   .  ; \
\
ls . | grep ipynb | xargs -I {} \
\
nbconvert '{}' \"" > ./install

echo ''
echo 'cat  INSTALL'
cat      ./install
echo ''

sudo mv ./install /usr/bin/jupyter
sudo chmod 755    /usr/bin/jupyter

jupyter
