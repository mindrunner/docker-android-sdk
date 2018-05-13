#!/bin/bash

mkdir -p /opt/android-sdk-linux/bin/
cp /opt/tools/android-env.sh /opt/android-sdk-linux/bin/
source /opt/android-sdk-linux/bin/android-env.sh

built_in_sdk=1

if [[ ! -z "$http_proxy" ]] || [[ ! -z "$https_proxy" ]]; then
  export JAVA_OPTS="-Djava.net.useSystemProxies=true $JAVA_OPTS -Dhttp.noProxyHosts=${no_proxy}"
  # This only works if there is a proxy listening on docker host machine and
  # container is started with --net=host. No other options for now. Thanks
  # google....
  export SDKMANAGER_OPTS=" --proxy=http --proxy_host=127.0.0.1 --proxy_port=3128 "
fi

printenv

echo $#

echo $1

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
mkdir -p ${ANDROID_HOME}/bin
cp -v /opt/tools/*.sh ${ANDROID_HOME}/bin

sdkmanager --help


echo "Installing packages"
if [ $built_in_sdk -eq 1 ]
then
    android-accept-licenses.sh "sdkmanager ${SDKMANAGER_OPTS} --package_file=/opt/tools/package-list-minimal.txt --verbose"
else
    android-accept-licenses.sh "sdkmanager ${SDKMANAGER_OPTS} --package_file=/opt/tools/package-list.txt --verbose"
fi

echo "Updating SDK"
update_sdk

echo "Accepting Licenses"
android-accept-licenses.sh "sdkmanager ${SDKMANAGER_OPTS} --licenses --verbose"
