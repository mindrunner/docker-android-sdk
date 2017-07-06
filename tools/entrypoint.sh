#!/usr/bin/env bash

chown android:android /opt/android-sdk-home
su - android -c /opt/tools/android-sdk-update.sh