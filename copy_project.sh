#!/bin/bash

buildDir=/mnt/source/doc/repository
deployProject=com.zizibujuan.drip.deploy.allInOne
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

echo "copy common server"

echo "copy doc"

echo "copy useradmin"

echo "copy cm"