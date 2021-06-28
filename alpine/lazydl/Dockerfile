FROM alpine:latest

LABEL de.mindrunner.android-docker.flavour="alpine-lazydl"

ARG GLIBC_VERSION="2.28-r0"

ENV ANDROID_SDK_HOME /opt/android-sdk-linux
ENV ANDROID_SDK_ROOT /opt/android-sdk-linux
ENV ANDROID_HOME /opt/android-sdk-linux
ENV ANDROID_SDK /opt/android-sdk-linux
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk

RUN apk --no-cache add \
  bash \
  ca-certificates \
  curl \
  expect \
  fontconfig \
  git \
  make \
  libstdc++ \
  libgcc \
  mesa-dev \
  nodejs \
  npm \
  openjdk8 \
  pulseaudio-dev \
  su-exec \
  ncurses \
  unzip \
  wget \
  zlib \
  && curl -f -L https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub -o /etc/apk/keys/sgerrand.rsa.pub \
  && curl -f -L https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk -o /tmp/glibc.apk \
  && curl -f -L https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-bin-${GLIBC_VERSION}.apk -o /tmp/glibc-bin.apk \
  && apk add /tmp/glibc.apk /tmp/glibc-bin.apk \
  && rm -rf /tmp/* \
  && mkdir -p /opt/android-sdk-linux \
  && addgroup android \
  && adduser android -D -G android -h /opt/android-sdk-linux -u 1000

# Copy Tools
COPY tools /opt/tools

# Copy Licenses
COPY licenses /opt/licenses

# Working Directory
WORKDIR /opt/android-sdk-linux

CMD ["/opt/tools/entrypoint.sh", "lazy-dl"]
