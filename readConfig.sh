#!/bin/bash

while read line ; do
    eval "$line"
done < proxy.config

if [[ ! -n $proxy_host ]] || [[ ! -n $proxy_port ]] ; then
    echo -e "\033[31m Please set the proxy host and port in proxy.config \033[0m"
    exit -1;
else
    echo -e "\033[32m proxy server : $proxy_host:$proxy_port \033[0m"
fi
exit 0;

