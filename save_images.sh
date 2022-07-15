#!/bin/bash

mkdir -p images
mkdir -p hashes

sudo apt install -y coreutils

echo ''
echo "requirement arg1 (export todo or not = 0 or 1)"
echo "passed arg1: $1"

export_todo=0

if (( ${#@} == 1 )) ; then export_todo=$1 ; fi

for image in `sudo docker image ls --format "{{.Repository}}"` ;
do
     echo ''
     echo '----------------------------------------------------------'
     echo "Doing: $image"

     sha256_new=`sudo docker images --no-trunc --quiet $image`
     todo=0
     exists=0
     
     sha256_new="${sha256_new/'sha256:'/}"
     echo "new value for sha 256 is: $sha256_new"

     if [[ -f hashes/$image.sha256 ]] ;
     then
          echo "sha 256 for: $image, exists"

          exists=1

          echo "exists saved value: $exists"
     else
          echo "sha 256 for: $image, does not exist"

          todo=1

          echo "not exist todo: $todo"
     fi
     
     if (( $exists > 0 )) ;
     then
          echo "old sha 256 for: $image, exists"

          sha256_old=`cat hashes/$image.sha256`
          echo "in file:  hashes/$image.sha256"

          sha256_old="${sha256_old/'sha256:'/}"
          echo "with value: $sha256_old"

          if [[ "$sha256_old" != "$sha256_new" ]] ; then todo=1 ; fi
          
          echo "sha 256 old != sha 256 new: $todo"
     fi
     
     if (( $todo > 0 )) ;
     then
          echo "todo: $todo"
          
          echo  -n $sha256_new      > hashes/$image.sha256
          echo     "sha 256 saved in: hashes/$image.sha256 is"
          cat                         hashes/$image.sha256
          
          echo ''
          echo "ls hashes folder"
          ls       hashes

          if (( $export_todo > 0 )) ;
          then
               echo "Doing export for image: $image"

               sudo docker save $image -o  images/$image.tar ; sync
               sudo chown kaumi            images/$image.tar
               sudo chmod 755              images/$image.tar

               echo "ls images folder"
               ls       images
          fi
     fi
done
