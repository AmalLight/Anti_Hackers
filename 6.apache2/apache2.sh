#!/bin/bash

sudo docker image     prune -f
sudo docker container prune -f

cp /home/kaumi/Git/public/bash/apacheme.sh ./ame.sh

sudo docker image build -t apache2 .

echo ''
echo '-------------------BIN'

echo " \
\
export port=8080                         ; \
if (( \${#@} > 0 )) ; then port=\$1 ; fi ; \
echo \" main port used: \$port \"        ; \
\
export dirv=\$PWD                        ; \
if (( \${#@} > 1 )) ; then dirv=\$2 ; fi ; \
echo \" main path used: \$dirv \"        ; \
\
echo \" apache2 tmp: apache2-\$port-tmp \" ; \
\
` cat run.sh ` " > ./install

echo ''
echo 'cat  INSTALL'
cat      ./install
echo ''

sudo mv ./install /usr/bin/apache2
sudo chmod 755    /usr/bin/apache2

apache2
