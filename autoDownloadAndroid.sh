#!/bin/bash
branch=$1
echo "branch name: $branch"
if [[ ! -n $branch ]] ; then
    echo "Useage : ./autoGetAndroidSource <branch>"
    exit -1 ;
fi
basepath=`dirname $0`
$basepath/checkConfig.sh
if [[ $? -ne 0 ]] ; then
    exit -1;
fi

set -v on
source $basepath/proxy.config
if [[ ! -d $branch ]] ; then
    echo "mkdir $branch";
    mkdir $branch;
fi
cd $branch;
echo "current dir : `pwd`";
PATH=~/bin:$PATH
export http_proxy=$proxy_host:$proxy_port
export https_proxy=$proxy_host:$proxy_port
export GIT_SSL_NO_VERIFY=1
if [[ ! -d .repo ]]; then
    repo init -u https://android.googlesource.com/platform/manifest -b $branch;
fi
repo sync
