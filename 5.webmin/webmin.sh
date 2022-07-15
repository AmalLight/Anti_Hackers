#!/bin/bash

sudo docker image     prune -f
sudo docker container prune -f

sudo docker image build -t webmin .

echo ''
echo '-------------------BIN'

echo " \
\
port=10000                               ; \
if (( \${#@} > 0 )) ; then port=\$1 ; fi ; \
echo \"port used: \$port\"               ; \
echo \"webmin tmp: webmin-\$port-tmp\"   ; \
\
sudo docker container stop webmin-\$port-tmp                                                    ; \
sudo docker run -d --rm --name webmin-\$port-tmp -p \$port:10000 -v \$PWD:/sharing webmin sh -c ' \
\
/etc/webmin/start ; \
tail -f /var/webmin/minserv.log '" > ./install

echo ''
echo 'cat INSTALL'
cat ./install
echo ''

sudo mv ./install /usr/bin/webmin
sudo chmod 755    /usr/bin/webmin

webmin
