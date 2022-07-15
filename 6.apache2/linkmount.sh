#!/bin/bash

while read -r mountFile ;

do
     noMount="${mountFile//'/var/www/html/mount'/'/var/www/html'}"

     parent=`dirname "$noMount"` && mkdir -p "$parent"

     ln -sf "$mountFile" "$noMount"

done </var/www/html/list.txt
