#!/bin/bash

dotGit=.git

while [ $# -gt 0 ]
do
	case "$1" in
		"-root")
			buildDir="$2"; shift;;
		
		*) break;;
	esac
	shift
done

echo "git clone/pull doc project"
if [[ ! -d $buildDir/doc/$dotGit]]; then
	pushd $buildDir
	git clone git@github.com:zizibujuan/doc.git
	popd
else
	pushd $buildDir/doc
	git pull
	popd
fi

echo "git clone/pull useradmin project"
if [[ ! -d $buildDir/useradmin/$dotGit]]; then
	pushd $buildDir
	git clone git@github.com:zizibujuan/useradmin.git
	popd
else
	pushd $buildDir/useradmin
	git pull
	popd
fi

echo "git clone/pull cm project"
if [[ ! -d $buildDir/cm/$dotGit]]; then
	pushd $buildDir
	git clone git@github.com:zizibujuan/cm.git
	popd
else
	pushd $buildDir/cm
	git pull
	popd
fi

echo "git clone/pull server.util"
if [[ ! -d $buildDir/server.util/$dotGit]]; then
	pushd $buildDir
	git clone git@github.com:zizibujuan/server.util.git
	popd
else
	pushd $buildDir/server.util
	git pull
	popd
fi

echo "git clone/pull server.jgit"
if [[ ! -d $buildDir/server.jgit/$dotGit]]; then
	pushd $buildDir
	git clone git@github.com:zizibujuan/server.jgit.git
	popd
else
	pushd $buildDir/server.jgit
	git pull
	popd
fi

echo "git clone/pull client.common"
if [[ ! -d $buildDir/client.common/$dotGit]]; then
	pushd $buildDir
	git clone git@github.com:zizibujuan/client.common.git
	popd
else
	pushd $buildDir/client.common
	git pull
	popd
fi

echo "git clone/pull server.dbaccess.mysql"
if [[ ! -d $buildDir/dbaccess.mysql/$dotGit]]; then
	pushd $buildDir
	git clone git@github.com:zizibujuan/dbaccess.mysql.git
	popd
else
	pushd $buildDir/dbaccess.mysql
	git pull
	popd
fi


echo "start copy osgi plugin and feature projects"
/bin/bash -l copy_project.sh

echo "build js and css"
# not impl

echo "start install projects"
mvn clean install

echo "restart server"
/bin/bash -l restart.sh

