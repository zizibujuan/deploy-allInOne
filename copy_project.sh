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

echo "copy common client"

docClientBundle=$buildDir/doc/client/bundles
cp -a $docClientBundle/com.zizibujuan.drip.client.doc $targetClientBundle
cp -a $docClientBundle/com.zizibujuan.client.ace $targetClientBundle
cp -a $docClientBundle/com.zizibujuan.client.bootstrap $targetClientBundle
cp -a $docClientBundle/com.zizibujuan.client.highlight $targetClientBundle
cp -a $docClientBundle/com.zizibujuan.client.jquery $targetClientBundle
cp -a $docClientBundle/com.zizibujuan.client.marked $targetClientBundle


echo "copy common server"

cp -a $buildDir/com.zizibujuan.dbaccess.mysql $targetServerBundle
cp -a $buildDir/com.zizibujuan.drip.server.exception $targetServerBundle
cp -a $buildDir/com.zizibujuan.drip.server.util $targetServerBundle

echo "copy doc"

docServerBundle=$buildDir/doc/server/bundles

cp -a $docServerBundle/com.zizibujuan.drip.server.doc.model $targetServerBundle
cp -a $docServerBundle/com.zizibujuan.drip.server.doc.servlet $targetServerBundle
cp -a $docServerBundle/com.zizibujuan.drip.server.doc.service $targetServerBundle
cp -a $docServerBundle/com.zizibujuan.drip.server.doc.service.impl $targetServerBundle
cp -a $docServerBundle/com.zizibujuan.drip.server.doc.dao $targetServerBundle
cp -a $docServerBundle/com.zizibujuan.drip.server.doc.dao.mysql $targetServerBundle

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