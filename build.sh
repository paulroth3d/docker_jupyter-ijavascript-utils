#!/bin/bash

unset ijsBuildVersion
export ijsBuildVersion=1.22.0

echo "will build new version:${ijsBuildVersion}"
echo "should we proceed?"

read shouldContinue

if [ "${shouldContinue}" != "y" ];
then
	return 0
fi

npm run docker:build

npm run docker:push
