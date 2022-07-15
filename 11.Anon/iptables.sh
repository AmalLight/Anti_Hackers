#!/bin/bash

iptables-legacy  -t  filter  -F
iptables-legacy  -t  filter  -A  OUTPUT  -d  192.168.31.1  -p  udp  --dport   53  -j  ACCEPT
iptables-legacy  -t  filter  -A  OUTPUT                    -p  tcp  --dport  443  -j  ACCEPT
iptables-legacy  -t  filter  -A  OUTPUT                    -p icmp                -j  ACCEPT
iptables-legacy  -t  filter  -A  INPUT   -s  192.168.31.1  -p  udp  --sport   53  -j  ACCEPT
iptables-legacy  -t  filter  -A  INPUT                     -p  tcp  --sport  443  -j  ACCEPT
iptables-legacy  -t  filter  -A  INPUT                     -p icmp                -j  ACCEPT
iptables-legacy  -t  filter  -A  OUTPUT                                           -j  DROP
iptables-legacy  -t  filter  -A  INPUT                                            -j  DROP
