common=/var/root/.jenkins/CommonFiles
rm    -rf $common
mkdir -p  $common

echo "#!/bin/bash"       > $common/2.common.sh
echo "mkdir -p $common" >> $common/2.common.sh
echo "common=$common"   >> $common/2.common.sh
echo "export common"    >> $common/2.common.sh

echo 'cat common file'
cat $common/2.common.sh
source $common/2.common.sh
echo "test exporting from common: $common"
