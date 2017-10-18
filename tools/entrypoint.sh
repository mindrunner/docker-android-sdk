#!/usr/bin/env bash

chown android:android /opt/android-sdk-linux
su - android -c /opt/tools/android-sdk-update.sh "$1"