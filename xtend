#!/usr/bin/env bash
set -e
# set -x

# Tx/ACK Gradle; this is heavily inspired by https://github.com/gradle/gradle/blob/master/gradlew

# TODO Win xtend.bat variant (or later make it be a native wrapper written in Go?)

# TODO XTENDS_CACHE
XTENDS_HOME=$HOME/.cache/xtends

# TODO XTENDS_HOME
XTENDS_INSTALL=install
# TODO distinguish testing dog fooding and real script
# XTENDS_INSTALL=$XTENDS_HOME/INSTALL
# TODO if $XTENDS_INSTALL does not exist,
# then fetch content via HTTP from.. git(raw)/#!xtend|xtends.ZIP and unzip..

# TODO how-to get full path of calling script? $0? basename? path? `pwd -p` Then use cp --parents ?
# SCRIPT_BUILD_DIR=$XTENDS_HOME/home/UID/dev/xtends/demo/
SCRIPT_BUILD_DIR=$XTENDS_HOME/demo
MAIN_CLASS_NAME=Main

# TODO how-to only if these files don't exist yet at source..
mkdir -p $SCRIPT_BUILD_DIR/gradle/wrapper
cp $XTENDS_INSTALL/gradle/gradlew $SCRIPT_BUILD_DIR
cp $XTENDS_INSTALL/gradle/gradle/wrapper/* $SCRIPT_BUILD_DIR/gradle/wrapper/
cp $XTENDS_INSTALL/gradle/build.gradle $SCRIPT_BUILD_DIR

# TODO sourceSet directly pointing to source?
mkdir -p $SCRIPT_BUILD_DIR/src/main/java/
cp $1 $SCRIPT_BUILD_DIR/src/main/java/
# TODO how-to later chop off first line so that it becomes valid Xtend.. shell, or Gradle plugin already?

# TODO how-to args.. just $* is NOK, because includes $0
$SCRIPT_BUILD_DIR/gradlew -q --daemon -p=$SCRIPT_BUILD_DIR -PmainClass=$MAIN_CLASS_NAME run
