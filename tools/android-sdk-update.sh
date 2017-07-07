#!/bin/bash

mkdir -p /opt/android-sdk-linux/tools/bin/
cp /opt/tools/android-env.sh /opt/android-sdk-linux/tools/bin/
source /opt/android-sdk-linux/tools/bin/android-env.sh

cd ${ANDROID_SDK_HOME}

if [ -f sdk-tools-linux.zip ]
then
  echo "SDK Tools already bootstrapped. Skipping initial setup"
else
  echo "Bootstrapping SDK-Tools"
  wget -q https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip -O sdk-tools-linux.zip
  unzip sdk-tools-linux.zip
fi

echo "Copying Licences"
cp -r /opt/licenses ${ANDROID_SDK_HOME}/licenses

echo "Copying Tools"
cp /opt/tools/*.sh ${ANDROID_SDK_HOME}/tools/bin

echo "Installing packages"
android-accept-licenses.sh "sdkmanager --package_file=/opt/tools/package-list.txt --verbose"

echo "Updating SDK"
update_sdk

echo "Accepting Licenses"
android-accept-licenses.sh "sdkmanager --licenses --verbose"
