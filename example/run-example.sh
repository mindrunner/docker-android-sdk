#!/bin/bash

source /opt/android-sdk-linux/bin/android-env.sh
source /opt/tools/locking.sh

if ! lockfile_waithold ; then
     exit 1
fi

${ANDROID_HOME}/platform-tools/adb devices

lockfile_release
