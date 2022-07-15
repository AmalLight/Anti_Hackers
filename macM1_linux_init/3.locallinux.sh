source /var/root/.jenkins/CommonFiles/2.common.sh

echo '#!/bin/bash' > $common/3.locallinux.sh

echo        'cat /etc/hosts'  >> $common/3.locallinux.sh
echo 'hosts=`cat /etc/hosts`' >> $common/3.locallinux.sh

echo 'if [[ "$hosts" != *"locallinux"* ]] ;'        >> $common/3.locallinux.sh
echo then                                           >> $common/3.locallinux.sh
echo "echo '192.168.31.8 locallinux' >> /etc/hosts" >> $common/3.locallinux.sh
echo 'cat                               /etc/hosts' >> $common/3.locallinux.sh
echo fi                                             >> $common/3.locallinux.sh

echo "common=$common" >> $common/3.locallinux.sh
echo 'export common'  >> $common/3.locallinux.sh

source $common/3.locallinux.sh
echo "test exporting from common: $common"