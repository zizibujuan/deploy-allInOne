#!/bin/bash

buildDir=/mnt/source/doc/repository
deployProject=deploy-allInOne
dotGit=.git

targetProject=$buildDir/$deployProject
targetServerBundle=$targetProject/server/bundles
targetServerFeature=$targetProject/server/features
targetClientBundle=$targetProject/client/bundles
releaseClientDir=$targetClientBundle/com.zizibujuan.drip.client.release/static

echo "delete old files..."
rm -rf $targetServerBundle
rm -rf $targetServerFeature
rm -rf $releaseClientDir


mkdir -p $targetServerBundle
mkdir -p $targetServerFeature
mkdir $targetClientBundle/com.zizibujuan.drip.client.release/static
