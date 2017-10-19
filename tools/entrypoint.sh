#!/usr/bin/env bash

su_mt_user() {
    su android -c '"$0" "$@"' -- "$@"
}

chown android:android /opt/android-sdk-linux
su_mt_user /opt/tools/android-sdk-update.sh ${1}