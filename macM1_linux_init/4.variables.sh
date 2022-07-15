#!/bin/bash

source /var/root/.jenkins/CommonFiles/3.locallinux.sh
rm -f $common/variables.json
curl http://locallinux:8080/macM1_linux_init/variables.json -o $common/variables.json

ls $common
cat $common/variables.json

export common