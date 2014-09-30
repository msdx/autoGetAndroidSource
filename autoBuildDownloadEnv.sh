#!/bin/bash
./readConfig.sh
if [[ $? -ne 0 ]] ; then
    exit -1;
fi
set -v on
sudo apt-get install curl git
if [[ ! -d ~/bin ]] ; then
    mkdir ~/bin
fi

if [[ ! -f ~/bin/repo ]]; then
    curl -x $proxy_host:$proxy_port http://git-repo.googlecode.com/files/repo-1.13 > ~/bin/repo
fi

chmod a+x ~/bin/repo
set -v off
