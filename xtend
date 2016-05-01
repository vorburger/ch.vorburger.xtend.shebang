#!/bin/bash
# ? #!/usr/bin/env bash

# This is a bash script for now,
# but later shall be a native wrapper written in Go
# so that this works cross-platform

# TODO how-to fail if sth. fails, same stuff I did for Docker scripts

$XTENDS_HOME=~/.cache/.xtends

XTENDS_INSTALL=install
# TODO distinguish testing dog fooding and real script
# XTENDS_INSTALL=$XTENDS_HOME/INSTALL
# TODO if $XTENDS_INSTALL does not exist,
# then fetch content via HTTP from.. git(raw)/#!xtend|xtends.ZIP and unzip..

# TODO how-to get full path of calling script? $0? basename? path? `pwd -p`
# SCRIPT_BUILD_DIR=$XTENDS_HOME/home/UID/dev/xtends/demo/
SCRIPT_BUILD_DIR=$XTENDS_HOME/demo
MAIN_CLASS_NAME=hello

# TODO how-to only if these files don't exist yet at source..
mkdir -p $SCRIPT_BUILD_DIR
cp -R $XTENDS_INSTALL/gradle/gradlew $SCRIPT_BUILD_DIR
cp -R $XTENDS_INSTALL/gradle/wrapper/*.jar $SCRIPT_BUILD_DIR/gradle/wrapper
cp -R $XTENDS_INSTALL/gradle/build.gradle $SCRIPT_BUILD_DIR

cp $0 $SCRIPT_BUILD_DIR
# TODO how-to later chop off first line so that it becomes valid Xtend.. shell, or Gradle plugin already?

$SCRIPT_BUILD_DIR/gradlew -d -task exec $MAIN_CLASS_NAME $*

