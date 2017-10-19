# docker-android-sdk
[![](https://images.microbadger.com/badges/version/runmymind/docker-android-sdk.svg)](https://microbadger.com/images/runmymind/docker-android-sdk "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/runmymind/docker-android-sdk.svg)](https://microbadger.com/images/runmymind/docker-android-sdk "Get your own image badge on microbadger.com")

[![](https://images.microbadger.com/badges/version/runmymind/docker-android-sdk:lazydl.svg)](https://microbadger.com/images/runmymind/docker-android-sdk:lazydl "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/runmymind/docker-android-sdk:lazydl.svg)](https://microbadger.com/images/runmymind/docker-android-sdk:lazydl "Get your own image badge on microbadger.com")

**WARNING:**

Some months ago I started using this image in different way:

The image contines only some bootstrapping files. The SDK itself will be downloaded into
a volume which is persistent and accessible by other conainers as well. I used a separate branch for this.

However, most of the users seem to use the master branch where the SDK and tons of dependencies are baked into the container.

I am about to merge those two approaches into one single branch, without breaking too much of what we used to have.


Now there are two Dockerfiles, thus two tags per branch on dockerhub.

- use tag "latest" for the old master branch behaviour [SDK built in]
- use tag "lazydl" for the lazy download behaviour [bootstrap SDK on container start]


Feel free to report Problems!
