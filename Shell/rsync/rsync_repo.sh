#!/bin/sh
# sync yum centos 6/7 repos
# mirror url:
# http://mirrors.ustc.edu.cn/centos/
# author: pengfei xue
# author: He Boliang

Date=`date +%Y%m%d`

rsyncBin="/usr/bin/rsync"

function rsync_yum_repo()
{
    repo_name=$1

    # build rsync paramters
    case $repo_name in
        centos)
            logFile="/data/log/rsync_yum/centos_$Date.log"
            excludeFile="/archive/yum.repos/centosExclude.list"
            rsyncParameters="-avrtL --delete --exclude-from $excludeFile"
            mirrorUrl="rsync://mirrors.ustc.edu.cn/centos/"
            localSyncPath="/archive/yum.repos/centos/"
        ;;
        epel)
            logFile="/data/log/rsync_yum/epel_$Date.log"
            excludeFile="/archive/yum.repos/epelExclude.list"
            rsyncParameters="-avrtL --delete --exclude-from $excludeFile"
            mirrorUrl="rsync://mirrors.ustc.edu.cn/epel/"
            localSyncPath="/archive/yum.repos/epel/"
        ;;
    esac

    # begin to sync
    echo "---- $Date `date +%T` Begin ----" >> $logFile
    $rsyncBin $mirrorUrl $rsyncParameters $localSyncPath >> $logFile 2>&1
    echo "---- $Date `date +%T` End ----" >> $logFile
}

for repo in centos epel
do
    rsync_yum_repo $repo
done
