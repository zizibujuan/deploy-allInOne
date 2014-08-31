#!/bin/bash

dotGit=.git

while [ $# -gt 0 ]
do
	case "$1" in
		"-buildDir")
			buildDir="$2"; shift;;
		
		*) break;;
	esac
	shift
done

echo "buildDir = $buildDir"

echo "git clone/pull doc project"
if [[ ! -d $buildDir/doc/$dotGit ]]; then
	pushd $buildDir
	echo "git clone project doc"
	git clone git@github.com:zizibujuan/doc.git
	popd
else
	pushd $buildDir/doc
	echo "git pull project doc"
	git pull
	popd
fi

echo "git clone/pull useradmin project"
if [[ ! -d $buildDir/useradmin/$dotGit ]]; then
	pushd $buildDir
	echo "git clone project useradmin"
	git clone git@github.com:zizibujuan/useradmin.git
	popd
else
	pushd $buildDir/useradmin
	echo "git pull project useradmin"
	git pull
	popd
fi

echo "git clone/pull cm project"
if [[ ! -d $buildDir/cm/$dotGit ]]; then
	pushd $buildDir
	echo "git clone project cm"
	git clone git@github.com:zizibujuan/cm.git
	popd
else
	pushd $buildDir/cm
	echo "git pull project cm"
	git pull
	popd
fi

echo "git clone/pull server.util"
if [[ ! -d $buildDir/server.util/$dotGit ]]; then
	pushd $buildDir
	echo "git clone project server.util"
	git clone git@github.com:zizibujuan/server.util.git
	popd
else
	pushd $buildDir/server.util
	echo "git pull project server.util"
	git pull
	popd
fi

echo "git clone/pull server.jgit"
if [[ ! -d $buildDir/server.jgit/$dotGit ]]; then
	pushd $buildDir
	echo "git clone project server.jgit"
	git clone git@github.com:zizibujuan/server.jgit.git
	popd
else
	pushd $buildDir/server.jgit
	echo "git pull project server.jgit"
	git pull
	popd
fi

echo "git clone/pull client.common"
if [[ ! -d $buildDir/client.common/$dotGit ]]; then
	pushd $buildDir
	echo "git clone project client.common"
	git clone git@github.com:zizibujuan/client.common.git
	popd
else
	pushd $buildDir/client.common
	echo "git pull project client.common"
	git pull
	popd
fi

echo "git clone/pull server.dbaccess.mysql"
if [[ ! -d $buildDir/dbaccess.mysql/$dotGit ]]; then
	pushd $buildDir
	echo "git clone project dbaccess.mysql"
	git clone git@github.com:zizibujuan/dbaccess.mysql.git
	popd
else
	pushd $buildDir/dbaccess.mysql
	echo "git pull project dbaccess.mysql"
	git pull
	popd
fi

echo "git clone/pull server.exception"
if [[ ! -d $buildDir/server.exception/$dotGit ]]; then
	pushd $buildDir
	echo "git clone project server.exception"
	git clone git@github.com:zizibujuan/server.exception.git
	popd
else
	pushd $buildDir/server.exception
	echo "git pull project server.exception"
	git pull
	popd
fi


echo "start copy osgi plugin and feature projects"
/bin/bash -l copy_project.sh

echo "build js and css"
# not impl

echo "start install projects"
mvn clean install -P rds_product

echo "restart server"
/bin/bash -l restart.sh

