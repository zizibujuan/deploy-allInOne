#!/bin/bash

buildDir=/mnt/source/doc/repository
deployProject=deploy-allInOne
dotGit=.git


echo "clone or pull allInOne project"

if [[ ! -d $buildDir ]]; then
	echo "first time create folder $buildDir"
	mkdir -p $buildDir
fi

if [[ ! -d $buildDir/$deployProject/$dotGit ]]; then
	pushd $buildDir
	pwd
	echo "git clone deploy project $deployProject"
	git clone git@github.com:zizibujuan/deploy-allInOne.git
	popd
else
	pushd $buildDir/$deployProject
	pwd
	echo "git pull deploy project $deployProject"
	git pull
	popd
fi


pushd $buildDir/$deployProject
	/bin/bash -l deploy.sh -buildDir $buildDir
popd