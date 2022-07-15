#!/bin/bash

SEC=60             ;
home=/var/www/html ;

bash $home/find.sh      ;
bash $home/linkmount.sh ;
pre=` ls $home `        ;

while true
do
     ls $home | xargs -I {} bash -c \
     \
     " [[ \" $pre \" != *'{}'* ]] && rm -rf \"$home/{}\" " ;

     sync                    ;
     bash $home/find.sh      ;
     bash $home/linkmount.sh ;

     sleep $SEC ;
done
