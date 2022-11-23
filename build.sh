#!/bin/bash

unset ijsBuildVersion
export ijsBuildVersion=1.22.3

echo "have you already published the latest npm package?"

read npmPublished

if [ "${npmPublished}" != "y" ];
then
	return 0
fi

echo "have you updated the package?"

read packageUpdated

if [ "${packageUpdated}" != "y" ];
then
	return 0
fi

echo "will build new version:${ijsBuildVersion}"
echo "should we proceed?"

read shouldContinue

if [ "${shouldContinue}" != "y" ];
then
	return 0
fi

npm run docker:build

npm run docker:push
