!#/bin/bash


export ANDROID_SDK_HOME=/opt/android-sdk-linux
export PATH=${PATH}:${ANDROID_SDK_HOME}/tools:${ANDROID_SDK_HOSDK_ME}/platform-tools:/opt/tools


cd ${ANDROID_SDK_HOME}

if [ -f android-sdk.tgz ]
then
	echo "SDK already bootstrapped. Skipping initial setup"
else
    wget -q https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz -O android-sdk.tgz
    tar -xvzf android-sdk.tgz
fi


android list sdk --no-ui --all --extended

echo y | android update sdk --no-ui --all --filter platform-tools
echo y | android update sdk --no-ui --all --filter extra-android-support

# SDKs
# Please keep these in descending order!
echo y | android update sdk --no-ui --all --filter android-26
echo y | android update sdk --no-ui --all --filter android-25
echo y | android update sdk --no-ui --all --filter android-24
echo y | android update sdk --no-ui --all --filter android-23
echo y | android update sdk --no-ui --all --filter android-22
echo y | android update sdk --no-ui --all --filter android-18
echo y | android update sdk --no-ui --all --filter android-16

echo y | android update sdk --no-ui --all --filter build-tools-26.0.0
echo y | android update sdk --no-ui --all --filter build-tools-25.0.3
echo y | android update sdk --no-ui --all --filter build-tools-25.0.2
echo y | android update sdk --no-ui --all --filter build-tools-25.0.1
echo y | android update sdk --no-ui --all --filter build-tools-25.0.0
echo y | android update sdk --no-ui --all --filter build-tools-24.0.3
echo y | android update sdk --no-ui --all --filter build-tools-24.0.2
echo y | android update sdk --no-ui --all --filter build-tools-24.0.1
echo y | android update sdk --no-ui --all --filter build-tools-24.0.0
echo y | android update sdk --no-ui --all --filter build-tools-23.0.3
echo y | android update sdk --no-ui --all --filter build-tools-23.0.2
echo y | android update sdk --no-ui --all --filter build-tools-23.0.1

echo y | android update sdk --no-ui --all --filter sys-img-x86-google_apis-26
echo y | android update sdk --no-ui --all --filter sys-img-x86-google_apis-25

echo y | android update sdk --no-ui --all --filter sys-img-armeabi-v7a-google_apis-25

echo y | android update sdk --no-ui --all --filter sys-img-x86_64-android-24
echo y | android update sdk --no-ui --all --filter sys-img-x86-android-24
echo y | android update sdk --no-ui --all --filter sys-img-armeabi-v7a-android-24
echo y | android update sdk --no-ui --all --filter sys-img-arm64-v8a-android-24

echo y | android update sdk --no-ui --all --filter sys-img-x86-android-23
echo y | android update sdk --no-ui --all --filter sys-img-armeabi-v7a-google_apis-23

echo y | android update sdk --no-ui --all --filter sys-img-x86-android-22
echo y | android update sdk --no-ui --all --filter sys-img-armeabi-v7a-android-22

echo y | android update sdk --no-ui --all --filter extra-android-m2repository
echo y | android update sdk --no-ui --all --filter extra-google-m2repository
echo y | android update sdk --no-ui --all --filter extra-google-google_play_services

echo y | android update sdk --no-ui --all --filter addon-google_apis-google-24

#Copy accepted android licenses
cp -r /opt/licenses ${ANDROID_SDK_HOME}/licenses

/opt/tools/android-accept-licenses.sh android update sdk --no-ui --obsolete --force

