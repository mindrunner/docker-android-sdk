# docker-cloud Build

Use one of the following Tags: (see below)

ubuntu-standalone
ubuntu-lazydl
alpine-standalone
alpine-lazydl
latest
lazydl

"latest" and "lazydl" are pointing to the ubuntu images


# docker-android-sdk
[![](https://images.microbadger.com/badges/version/runmymind/docker-android-sdk.svg)](https://microbadger.com/images/runmymind/docker-android-sdk "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/runmymind/docker-android-sdk.svg)](https://microbadger.com/images/runmymind/docker-android-sdk "Get your own image badge on microbadger.com")

[![](https://images.microbadger.com/badges/version/runmymind/docker-android-sdk:lazydl.svg)](https://microbadger.com/images/runmymind/docker-android-sdk:lazydl "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/runmymind/docker-android-sdk:lazydl.svg)](https://microbadger.com/images/runmymind/docker-android-sdk:lazydl "Get your own image badge on microbadger.com")

[![](https://images.microbadger.com/badges/version/runmymind/docker-android-sdk:ubuntu-lazydl.svg)](https://microbadger.com/images/runmymind/docker-android-sdk:ubuntu-lazydl "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/runmymind/docker-android-sdk:ubuntu-lazydl.svg)](https://microbadger.com/images/runmymind/docker-android-sdk:ubuntu-lazydl "Get your own image badge on microbadger.com")

[![](https://images.microbadger.com/badges/version/runmymind/docker-android-sdk:ubuntu-standalone.svg)](https://microbadger.com/images/runmymind/docker-android-sdk:ubuntu-standalone "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/runmymind/docker-android-sdk:ubuntu-standalone.svg)](https://microbadger.com/images/runmymind/docker-android-sdk:ubuntu-standalone "Get your own image badge on microbadger.com")

[![](https://images.microbadger.com/badges/version/runmymind/docker-android-sdk:alpine-lazydl.svg)](https://microbadger.com/images/runmymind/docker-android-sdk:alpine-lazydl "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/runmymind/docker-android-sdk:alpine-lazydl.svg)](https://microbadger.com/images/runmymind/docker-android-sdk:alpine-lazydl "Get your own image badge on microbadger.com")

[![](https://images.microbadger.com/badges/version/runmymind/docker-android-sdk:alpine-standalone.svg)](https://microbadger.com/images/runmymind/docker-android-sdk:alpine-standalone "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/runmymind/docker-android-sdk:alpine-standalone.svg)](https://microbadger.com/images/runmymind/docker-android-sdk:alpine-standalone "Get your own image badge on microbadger.com")


This repository contains Dockerfiles to create Docker images containing the android SDK. There are two flavours for different use cases (lazydl, standalone) and two different linux bases (ubuntu, alpine). Feel free to chose which one suits you best.

**Ubuntu**
The officialy supported Linux distribution for Android SDK builds. Use this one if you are unsure.

**Alpine**
More lightweight Linux Distribution optimized for docker containers. (Not officially supported / Android Emulator broken)

**Standalone**
This is the standard expected behaviour. The Android SDK is integrated in the docker image. Use this in your android build on CircleCI, Bitbucket Pipelines, or any other docker enabled CI.

**Lazydl**
Indeed, there is a lack of documentation and it might be not really intuitive to use the image in this way. The idea is to have two containers for the build process. One of which is the builing container executing the actual build. The other one is the sdk-data container, which downloads the whole SDK into a named docker volume which is shared between both containers.

Lazydl can also be used to download and prepare a custom list of sdk components if you only need a portion of the sdk. Just mount a volume in at runtime pointing a list named `package-list-minimal.txt` into `/opt/tools/package-list-minimal.txt` and then run `/opt/tools/entrypoint.sh built-in`. You can also use Lazydl as a base for your own custom image.
