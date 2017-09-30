#!/bin/bash

mkdir -p /opt/android-sdk-linux/tools/bin/
cp /opt/tools/android-env.sh /opt/android-sdk-linux/tools/bin/
source /opt/android-sdk-linux/tools/bin/android-env.sh

cd ${ANDROID_HOME}

if [ -f sdk-tools-linux.zip ]
then
  echo "SDK Tools already bootstrapped. Skipping initial setup"
else
  echo "Bootstrapping SDK-Tools"
  wget -q https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip -O sdk-tools-linux.zip
  unzip sdk-tools-linux.zip
fi

echo "Make sure repositories.cfg exists"
mkdir -p ~/.android/
touch ~/.android/repositories.cfg

echo "Copying Licences"
cp -rv /opt/licenses ${ANDROID_HOME}/licenses

echo "Copying Tools"
cp -v /opt/tools/*.sh ${ANDROID_HOME}/tools/bin

echo "Installing packages"
android-accept-licenses.sh "sdkmanager --package_file=/opt/tools/package-list.txt --verbose"

echo "Updating SDK"
update_sdk

echo "Accepting Licenses"
android-accept-licenses.sh "sdkmanager --licenses --verbose"
