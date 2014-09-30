#!/bin/bash
if [[ ! -n $1 ]] ; then
    echo "Useage : ./autoGetAndroidSource <branch>"
    exit -1 ;
fi
./readConfig.sh
if [[ $? -ne 0 ]] ; then
    exit -1;
fi

set -v on
if [[ ! -d $1 ]] ; then
    echo "mkdir $1";
    mkdir $1;
fi
cd $1;
echo "current dir : `pwd`";
if [[ ! -d .repo ]]; then
    echo "repo init -u https://android.googlesource.com/platform/manifest -b $1";
    repo init -u https://android.googlesource.com/platform/manifest -b $1;
fi
export http_proxy=192.168.137.1:8087
export https_proxy=192.168.137.1:8087
export GIT_SSL_NO_VERIFY=1
repo sync
