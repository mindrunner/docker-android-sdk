#!/bin/bash


export ANDROID_SDK_HOME=/opt/android-sdk-linux
export PATH=${PATH}:${ANDROID_SDK_HOME}/platform-tools:${ANDROID_SDK_HOME}/tools/bin:${ANDROID_SDK_HOME}/emulator:/opt/tools


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

echo "Installing packages"
/opt/tools/android-accept-licenses.sh "sdkmanager --package_file=/opt/tools/package-list.txt --verbose"

echo "Updating SDK"
/opt/tools/android-accept-licenses.sh "sdkmanager --update --verbose"

echo "Accepting Licenses"
/opt/tools/android-accept-licenses.sh "sdkmanager --licenses --verbose"
