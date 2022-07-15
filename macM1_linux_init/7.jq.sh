#!/bin/bash

source /var/root/.jenkins/CommonFiles/4.variables.sh

source $common/5.path.sh

cat $common/variables.json | jq .test

export common PATH