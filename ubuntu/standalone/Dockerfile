FROM ubuntu:22.04

LABEL de.mindrunner.android-docker.flavour="ubuntu-standalone"

ENV ANDROID_SDK_HOME /opt/android-sdk-linux
ENV ANDROID_SDK_ROOT /opt/android-sdk-linux
ENV ANDROID_HOME /opt/android-sdk-linux
ENV ANDROID_SDK /opt/android-sdk-linux

ENV DEBIAN_FRONTEND noninteractive

RUN dpkg --add-architecture i386 && apt-get update -yqq && apt-get install -y \
  curl \
  expect \
  git \
  libarchive-tools \
  locales \
  make \
  openjdk-17-jdk \
  openssh-client \
  unzip \
  vim \
  wget \
  zip \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANG en_US.UTF-8

RUN groupadd android && useradd -d /opt/android-sdk-linux -g android -u 1000 android

COPY tools /opt/tools

COPY licenses /opt/licenses

WORKDIR /opt/android-sdk-linux

RUN /opt/tools/entrypoint.sh built-in

CMD /opt/tools/entrypoint.sh built-in
