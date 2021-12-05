#!bin/bash

mkdir newUpper/
mkdir newWorkDir/
mkdir newOverlay/

upperDirsNew=newUpper
workDir=newWorkDir

lowerDirs=’docker inspect $1 | jq .[0].GraphDriver.Data.LowerDir | cut –c 2- | rev | cut –c 2- | rev’
upperDirs=’docker inspect $1 | jq .[0].GraphDriver.Data.UpperDir| cut –c 2- | rev | cut –c 2- | rev’

cp –r $upperDirs $upperDirsNew
mount –t overlay –olowerdir=$lowerDirs,upperdir=$upperDirsNew,workdir=$workDir none newOverlay
