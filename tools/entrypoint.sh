chown android:android /opt/android-sdk-linux
exec su-exec android:android /opt/tools/android-sdk-update.sh "$@"
