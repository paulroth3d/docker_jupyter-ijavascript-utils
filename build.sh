#!/bin/bash

export ijsBuildVersion=1.21.6

echo "will build new version:${ijsBuildVersion}"
echo "should we proceed?"

read shouldContinue

if [ "${shouldContinue}" != "y" ];
then
	return 0
fi

npm run docker:build

npm run docker:push
