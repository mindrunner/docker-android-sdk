# Use the Microsoft dev container as the base image
FROM mcr.microsoft.com/vscode/devcontainers/universal

# Set environment variables used by the Android SDK
ENV ANDROID_SDK_HOME /opt/android-sdk-linux
ENV ANDROID_SDK_ROOT /opt/android-sdk-linux
ENV ANDROID_HOME /opt/android-sdk-linux
ENV ANDROID_SDK /opt/android-sdk-linux

# Set Debian to not prompt for user input during package installation
ENV DEBIAN_FRONTEND noninteractive

# Update package list and install packages required for Android app development
RUN apt-get update -yqq && \
    apt-get install -y \
      curl \
      expect \
      git \
      make \
      wget \
      unzip \
      vim \
      openssh-client \
      locales \
      libarchive-tools && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

# Set the system language to US English
ENV LANG en_US.UTF-8

# Create a new group and user with UID 1001
RUN groupadd android && \
    useradd -d /opt/android-sdk-linux -g android -u 1001 android

# Copy the tools and licenses directories to the /opt directory in the image
COPY tools /opt/tools
COPY licenses /opt/licenses

# Set the working directory to /opt/android-sdk-linux and run the entrypoint script
WORKDIR /opt/android-sdk-linux
RUN /opt/tools/entrypoint.sh built-in
