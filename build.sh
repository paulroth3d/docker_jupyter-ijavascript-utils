#!/bin/bash

echo "have you already published the latest npm package? (y/n)"

read npmPublished

if [ "${npmPublished}" != "y" ];
then
	return 0
fi

echo "updating the package.json file"

npm run npm:refresh

echo "refresh the version"

npm run package:version:set
npm run package:version:get

ijsBuildVersion="$(npm run package:version:get --silent)"

echo "will build new version:${ijsBuildVersion}"
echo "should we proceed? (y/n)"

read shouldContinue

if [ "${shouldContinue}" != "y" ];
then
	return 0
fi

npm run docker:build

npm run docker:push
