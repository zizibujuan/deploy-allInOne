#!/bin/bash

buildDir=/mnt/source/doc/repository
deployProject=deploy-allInOne
dotGit=.git

targetProject=$buildDir/$deployProject
targetServerBundle=$targetProject/server/bundles
targetServerFeature=$targetProject/server/features
targetClientBundle=$targetProject/client/bundles

echo "delete old files..."
rm -rf $targetServerBundle
rm -rf $targetServerFeature
rm -rf $targetClientBundle

mkdir -p $targetServerBundle
mkdir -p $targetServerFeature
mkdir -p $targetClientBundle

echo "copy common client"

releaseClientDir=$targetClientBundle/com.zizibujuan.drip.client.release/static

mkdir -p $releaseClientDir/doc
mkdir -p $releaseClientDir/ace
mkdir -p $releaseClientDir/bootstrap
mkdir -p $releaseClientDir/highlight
mkdir -p $releaseClientDir/jquery
mkdir -p $releaseClientDir/marked


docClientBundle=$buildDir/doc/client/bundles
cp -a $docClientBundle/com.zizibujuan.drip.client.doc/web/doc $releaseClientDir/doc
cp -a $docClientBundle/com.zizibujuan.client.ace/static/ace $releaseClientDir/ace
cp -a $docClientBundle/com.zizibujuan.client.bootstrap/static/bootstrap $releaseClientDir/bootstrap
cp -a $docClientBundle/com.zizibujuan.client.highlight/static/highlight $releaseClientDir/highlight
cp -a $docClientBundle/com.zizibujuan.client.jquery/static/jquery $releaseClientDir/jquery
cp -a $docClientBundle/com.zizibujuan.client.marked/static/marked $releaseClientDir/marked


echo "copy common server"

mkdir -p $targetServerBundle/com.zizibujuan.dbaccess.mysql
mkdir -p $targetServerBundle/com.zizibujuan.drip.server.exception
mkdir -p $targetServerBundle/com.zizibujuan.drip.server.util
mkdir -p $targetServerBundle/com.zizibujuan.server.git

cp -a $buildDir/dbaccess.mysql/* $targetServerBundle/com.zizibujuan.dbaccess.mysql/
cp -a $buildDir/server.exception/* $targetServerBundle/com.zizibujuan.drip.server.exception/
cp -a $buildDir/server.util/* $targetServerBundle/com.zizibujuan.drip.server.util/
cp -a $buildDir/server.jgit/* $targetServerBundle/com.zizibujuan.server.git/

echo "copy doc"

docServerBundle=$buildDir/doc/server/bundles
docServerFeature=$buildDir/doc/server/features

cp -a $docServerBundle/com.zizibujuan.drip.server.doc.configurator $targetServerBundle
cp -a $docServerBundle/com.zizibujuan.drip.server.doc.model $targetServerBundle
cp -a $docServerBundle/com.zizibujuan.drip.server.doc.servlet $targetServerBundle
cp -a $docServerBundle/com.zizibujuan.drip.server.doc.service $targetServerBundle
cp -a $docServerBundle/com.zizibujuan.drip.server.doc.service.impl $targetServerBundle
cp -a $docServerBundle/com.zizibujuan.drip.server.doc.dao $targetServerBundle
cp -a $docServerBundle/com.zizibujuan.drip.server.doc.dao.mysql $targetServerBundle
cp -a $docServerFeature/com.zizibujuan.drip.server.doc-feature $targetServerFeature


echo "copy useradmin"

useradminServerBundle=$buildDir/useradmin/server/bundles

cp -a $useradminServerBundle/com.zizibujuan.useradmin.server.model $targetServerBundle
cp -a $useradminServerBundle/com.zizibujuan.useradmin.server.configurator $targetServerBundle
cp -a $useradminServerBundle/com.zizibujuan.useradmin.server.servlets $targetServerBundle
cp -a $useradminServerBundle/com.zizibujuan.useradmin.server.service $targetServerBundle
cp -a $useradminServerBundle/com.zizibujuan.useradmin.server.service.impl $targetServerBundle
cp -a $useradminServerBundle/com.zizibujuan.useradmin.server.dao $targetServerBundle
cp -a $useradminServerBundle/com.zizibujuan.useradmin.server.dao.mysql $targetServerBundle

cp -a $useradminServerBundle/com.zizibujuan.server.oauth2.sinaWeibo $targetServerBundle

echo "copy cm"

cmServerBundle=$buildDir/cm/server/bundles

cp -a $cmServerBundle/com.zizibujuan.cm.server.configurator $targetServerBundle
cp -a $cmServerBundle/com.zizibujuan.cm.server.model $targetServerBundle
cp -a $cmServerBundle/com.zizibujuan.cm.server.servlets $targetServerBundle
cp -a $cmServerBundle/com.zizibujuan.cm.server.service $targetServerBundle
cp -a $cmServerBundle/com.zizibujuan.cm.server.service.impl $targetServerBundle
cp -a $cmServerBundle/com.zizibujuan.cm.server.dao $targetServerBundle
cp -a $cmServerBundle/com.zizibujuan.cm.server.dao.mysql $targetServerBundle