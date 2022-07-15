#!/bin/bash

if (( ${#@} == 4 )) ;
then
     dir="$1" ; hostname="$2" ; port="$3" ; wanted="$4"

     if [[ ! -d $dir ]] ; then mkdir -p $dir ; fi

     echo "Using this dir: $dir"
     echo "Using this hostname: $hostname"

     list_from="http://$hostname:$port/list.txt"
     echo "Get list from: $list_from"

     curl $list_from -o $dir/list.txt

     while read -r elist ;
     do
          skip=0

          if [[ "$wanted" != '*' ]] ;
          then
               skip=1

               for want in $wanted ;
               do
                    if [[ "$elist" == *+($want)* ]] ;
                    then
                         skip=0 && break
                    else
                         skip=1
                    fi
               done
          fi
          
          if (( $skip > 0 )) ; then continue ; fi

          dir_elist=${elist//'/var/www/html/mount'/$dir}
          echo "element list to dir: $dir_elist" 

          srv_elist=${elist//'/var/www/html/'/''}
          echo "element list on server: $srv_elist"

          parent_dir_elist=`dirname "$dir_elist"`
          mkdir -p "$parent_dir_elist"
          echo "make parent dir: $parent_dir_elist"

          wget http://$hostname:$port/"$srv_elist" -O "$dir_elist"

     done  <$dir/list.txt
     rm -rf $dir/list.txt
     echo "Result:"
     ls $dir
else
     echo ''
     echo 'arg1 : directory , path used for save files'
     echo 'arg2 : hostname like 127.0.0.1 without / to the end'
     echo 'arg3 : port used to get the storage'
     echo 'arg4 : wanted elements I like to get'
     echo ''
fi
