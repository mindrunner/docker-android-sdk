FROM ubuntu:17.04

# ------------------------------------------------------
# --- Install required tools
# Dependencies to execute Android builds
#RUN dpkg --add-architecture i386
#RUN apt-get update -qq
#RUN DEBIAN_FRONTEND=noninteractive apt-get install -y openjdk-8-jdk libc6:i386 libstdc++6:i386 libgcc1:i386 libncurses5:i386 libz1:i386
RUN apt-get update -qq \
    && apt-get install -y openjdk-8-jdk wget expect unzip vim \
    && apt-get clean

# ------------------------------------------------------
# --- Download Android SDK tools into $ANDROID_SDK_HOME

RUN groupadd android && useradd -d /opt/android-sdk-home -g android android

COPY tools /opt/tools

COPY licenses /opt/licenses

WORKDIR /opt/android-sdk-home

CMD "chown android:android /opt/android-sdk-home && su - android -c /opt/tools/android-sdk-update.sh"
