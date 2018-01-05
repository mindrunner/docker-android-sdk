# docker-cloud Build

Builds with docker cloud are running smoothly. No need to change URLs or something. We have the following tags now:

ubuntu-standalone
ubuntu-lazydl
alpine-standalone
alpine-lazydl
latest
lazydl

"latest" and "lazydl" are pointing to the ubuntu images. No idea if we really need them, but prevents older builds to fail.


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

**Ububtu**
The officialy supported Linux distribution for Android SDK builds. Use this one if you are unsure, which is better.

**Alpine**
More lightweight Linux Distribution optimized for docker containers.

**Standalone**
This is the standard expected behaviour. The Android SDK is integrated in the docker image. Use this in your android build on CircleCI, Bitbucket Pipelines, or any other docker enabled CI.

**Lazydl**
Indeed, there is a lack of documentation and it might be not really intuitive to use the image in this way. The idea is to have two containers for the build process. One of which is the builing container executing the actual build. The other one is the sdk-data container, which downloads the whole SDK into a named docker volume which is shared between both containers.
I will provide an example docker-compose file to make this more clear. Might take a couple of days, though.
