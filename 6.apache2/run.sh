echo " run port used: $port " ;
echo " run path used: $dirv " ;

pre=''       ;
iam=`whoami` ;
if [[ $iam != *'root'* ]] ; then pre='sudo' ; fi ;

$pre docker container stop apache2-$port-tmp  ;
$pre docker run     --name apache2-$port-tmp -d \
\
--rm -p $port:80 -v $dirv:/var/www/html/mount:ro \
\
apache2 sh -c ' \
\
systemctl restart update2 ; \
systemctl restart apache2 ; \
\
tail -f /var/log/apache2/access.log ; '
