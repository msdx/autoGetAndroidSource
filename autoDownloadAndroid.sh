#!/bin/bash
if [[ ! -n $1 ]] ; then
    echo "Useage : ./autoGetAndroidSource <branch>"
    exit -1 ;
fi
./checkConfig.sh
if [[ $? -ne 0 ]] ; then
    exit -1;
fi

set -v on
source proxy.config
if [[ ! -d $1 ]] ; then
    echo "mkdir $1";
    mkdir $1;
fi
cd $1;
echo "current dir : `pwd`";
PATH=~/bin:$PATH
if [[ ! -d .repo ]]; then
    echo "repo init -u https://android.googlesource.com/platform/manifest -b $1";
    repo init -u https://android.googlesource.com/platform/manifest -b $1;
fi
export http_proxy=$proxy_host:$proxy_port
export https_proxy=$proxy_host:$proxy_port
export GIT_SSL_NO_VERIFY=1
repo sync
