#!/bin/bash

buildDir=/mnt/source/doc/repository
deployProject=com.zizibujuan.drip.deploy.allInOne
dotGit=.git


echo "clone or pull allInOne project"

if [[ ! -d $buildDir ]]; then
	echo "first time create folder $buildDir"
	mkdir $buildDir
fi

if [[ ! -d $buildDir/$deployProject/$dotGit]]; then
	pushd $buildDir
	git clone git@github.com:zizibujuan/deploy-allInOne.git
	popd
else
	pushd $buildDir/$deployProject
	git pull
	popd
fi


pushd $buildDir/$deployProject
	/bin/bash -l deploy.sh -buildDir $buildDir
popd