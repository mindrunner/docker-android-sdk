#!/bin/bash

mkdir -p /opt/android-sdk-linux/bin/
cp /opt/tools/android-env.sh /opt/android-sdk-linux/bin/
source /opt/android-sdk-linux/bin/android-env.sh

built_in_sdk=1

echo "Args : $@"

if [ $# -ge 0 ] && [ "$1" == "lazy-dl" ]
then
    echo "Using Lazy Download Flavour"
    built_in_sdk=0
elif [ $# -ge 0 ] && [ "$1" == "built-in" ]
then
    echo "Using Built-In SDK Flavour"
    built_in_sdk=1
else
    echo "Please use either built-in or lazy-dl as parameter"
    exit 1
fi

cd ${ANDROID_HOME}
echo "Set ANDROID_HOME to ${ANDROID_HOME}"

if [ -f .bootstrapped ]
then
    echo "SDK Tools already bootstrapped. Skipping initial setup"
else
    echo "Bootstrapping SDK-Tools"
    wget -q http://dl.google.com/android/repository/sdk-tools-linux-4333796.zip -O sdk-tools-linux.zip \
      && unzip sdk-tools-linux.zip \
      && touch .bootstrapped \
      && rm sdk-tools-linux.zip
fi

echo "Make sure repositories.cfg exists"
mkdir -p ~/.android/
touch ~/.android/repositories.cfg

echo "Copying Licences"
cp -rv /opt/licenses ${ANDROID_HOME}/licenses

echo "Copying Tools"
mkdir -p ${ANDROID_HOME}/bin
cp -v /opt/tools/*.sh ${ANDROID_HOME}/bin

echo "Print sdkmanager version"
sdkmanager --version


echo "Installing packages"
if [ $built_in_sdk -eq 1 ]
then
    while read p; do 
      android-accept-licenses.sh "sdkmanager --verbose ${SDKMNGR_OPTS} ${p}"
    done < /opt/tools/package-list-minimal.txt
else
    while read p; do
      android-accept-licenses.sh "sdkmanager --verbose ${SDKMNGR_OPTS} ${p}"
    done < /opt/tools/package-list.txt
fi

echo "Updating SDK"
update_sdk

echo "Accepting Licenses"
android-accept-licenses.sh "sdkmanager ${SDKMNGR_OPTS} --licenses --verbose"

echo "Downloading old ndk"
if [ $built_in_sdk -eq 1 ] && [ "$2" == "ndk" ]
then
    if [ -f .ndk ]
    then
        echo "NDK already bootstrapped. Skipping initial setup"
    else
        echo "Installing NDK"
        wget -q https://dl.google.com/android/repository/android-ndk-r14b-linux-x86_64.zip -O android-ndk-r14b-linux-x86_64.zip \
          && mkdir -p ${ANDROID_NDK_DIR} \
          && unzip android-ndk-r14b-linux-x86_64.zip -d ${ANDROID_NDK_DIR} \
          && touch .ndk \
          && rm android-ndk-r14b-linux-x86_64.zip \
          && rm -rf ndk-bundle \
          && ln -s ${ANDROID_NDK_HOME} ndk-bundle
    fi
else
    echo "Do not install ndk"
fi
