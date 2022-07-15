
echo ''
echo '-------------------IPTABLES'

sudo iptables -t filter -X
sudo iptables -t filter -F

sudo iptables -t nat -X
sudo iptables -t nat -F

sudo iptables -t mangle -X
sudo iptables -t mangle -F

sudo iptables -t filter -L -v -n
sudo iptables -t nat    -L -v -n
sudo iptables -t mangle -L -v -n

echo ''

sleep 2

sudo service docker stop

sleep 2

sudo service docker start

echo ''
echo '-------------------DOCKER'

yes | sudo docker container prune

imgs=(`sudo docker images --filter "dangling=true" --quiet --no-trunc`)

for img in ${imgs[@]} ; do sudo docker rmi $img ; done

echo

sudo docker system prune -f

# sudo docker system prune -af # all

echo ''

sudo docker image list
sudo docker ps    --all