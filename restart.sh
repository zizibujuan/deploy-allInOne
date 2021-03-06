#!/bin/bash

#部署的文件夹
serverHome=/mnt/server/
#项目名称
projectName=com.zizibujuan.drip


#maven仓库所在的路径
mavenDir=/root/.m2/repository/com/zizibujuan/drip/com.zizibujuan.drip.product/0.0.1-SNAPSHOT/

#product压缩文件
zipFile=com.zizibujuan.drip.product-0.0.1-SNAPSHOT-linux.gtk.x86_64.zip

#TODO：备份zip文件
#$mavenDir$zipFile
# mv $mavenDir$zipFile /mnt/backup/

#关闭正在运行的服务器
echo 判断是否已有服务器在运行
if [ -e "$serverHome$projectName/current.pid" ];
then
	echo 是的，有服务器正在运行
        runningPID=`cat $serverHome$projectName/current.pid`
        echo 删除进程$runningPID
        kill -15 $runningPID
	# 启动drip时，也会产生一个java进程，如果不删除该进程，则jetty服务器中的内容一直被缓存
 	let "runningPID += 1"
        kill -15 $runningPID
        rm $serverHome$projectName/current.pid
	echo 删除旧的部署文件
	rm -rf $serverHome$projectName
fi

#解压新的zip到部署的文件夹中
echo 将zip文件解压缩到web服务器的发布文件夹中
unzip -q $mavenDir$zipFile -d $serverHome$projectName

#进入server文件夹
pushd $serverHome$projectName
ls
#启动服务器
chmod +x eclipse
echo 启动服务器
./eclipse >> log.txt 2>&1 &
echo "$!"
pid_eclipse="$!"
echo $pid_eclipse > $serverHome$projectName/current.pid
popd
echo "Restart complete"
