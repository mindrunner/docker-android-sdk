<a name="readme-top"></a>

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]

<div align="center">
<h3 align="center">docker-android-sdk</h3>
  <p align="center">
    Docker image containing the <a href="https://developer.android.com/tools">Android SDK</a>
    <br />
    <br />
    ·
    <a href="https://github.com/mindrunner/docker-android-sdk/issues">Report Bug</a>
    ·
    <a href="https://github.com/mindrunner/docker-android-sdk/issues">Request Feature</a>
    ·
  </p>
</div>

<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#announcement">Announcement</a>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#tags">Tags</a></li>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#usage">Usage</a>
      <ul>
        <li><a href="#compile-and-run">Compile and Run</a></li>
      </ul>
    </li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#disclaimer">Disclaimer</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#donations">Donations</a></li>
  </ol>
</details>


<!-- ANNOUNCEMENT -->
## Announcement
### Builds
 * The build pipeline was migrated to github actions. (see below for available tags)
 * Nightly build are suffixed with the date
          
### Major Changes
 * JDK was upgraded from 11 to 17

### 2023 Spring Cleaning
 * https://github.com/mindrunner/docker-android-sdk/issues/92

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ABOUT -->
## About The Project

### docker-android-sdk
This repository contains Dockerfiles to create Docker images containing the Android SDK. There are two flavors for different use cases (lazydl, standalone) and two different linux bases (ubuntu, alpine). Feel free to chose which one suits you best.

**Ubuntu**
The officially supported Linux distribution for Android SDK builds. Use this one if you are unsure.

**Alpine**
More lightweight Linux Distribution optimized for docker containers. (Not officially supported / Android Emulator broken)

**Standalone**
This is the standard expected behaviour. The Android SDK is integrated in the docker image. Use this in your android build on CircleCI, Bitbucket Pipelines, or any other docker enabled CI.

**Lazydl**
Indeed, there is a lack of documentation and it might be not really intuitive to use the image in this way. The idea is to have two containers for the build process. One of which is the building container executing the actual build. The other one is the sdk-data container, which downloads the whole SDK into a named docker volume which is shared between both containers.

Lazydl can also be used to download and prepare a custom list of sdk components if you only need a portion of the sdk. Just mount a volume in at runtime pointing a list named `package-list-minimal.txt` into `/opt/tools/package-list-minimal.txt` and then run `/opt/tools/entrypoint.sh built-in`. You can also use Lazydl as a base for your own custom image.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- TAGS -->
### Tags
Matrix building strategy with `os = [ ubuntu, alpine ]` and `flavor = [ lazydl, standalone ]`

Use one of the following Tags: (see below)

- `${os}-${flavor}`
- `latest`
- `${flavor}` [resolves to `ubuntu`]
- `${os}-${flavor}-${YYYYMMDD}`
- `${os}-${flavor}-sha-${commit_sha}`
- `${os}-${flavor}-${branch}`

See https://hub.docker.com/repository/docker/runmymind/docker-android-sdk for all available tags



### Built With

[![Docker][docker]][Docker-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- USAGE -->
## Usage

TBD.

### Compile and run

TBD. 

## Roadmap

- [] TBD.

See the [open issues](https://github.com/mindrunner/docker-android-sdk/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- DISCLAIMER -->
## Disclaimer

TBD.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->
## License
Distributed under the GPLv3. See `LICENSE` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- DONATIONS -->
## Donations
### Paypal
  - https://paypal.me/mindrunner
### Bitcoin
  - `bc1q7uqyr4qh66tt8sz5ftw2e8septtpykksad4kpv`
### EVM (Ethereum, Polygon, Arbitrum, BSC, ...)
  - `0xC5eb68c9218AF7D0d4f40DB42041166B27525148`
### Solana
  - `48gzzxipVLbt8WuTmxYMGwYQK5fD3yQSy7yRsXSRwP7N`

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/mindrunner/docker-android-sdk.svg?style=for-the-badge
[contributors-url]: https://github.com/mindrunner/docker-android-sdk/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/mindrunner/docker-android-sdk.svg?style=for-the-badge
[forks-url]: https://github.com/mindrunner/docker-android-sdk/network/members
[stars-shield]: https://img.shields.io/github/stars/mindrunner/docker-android-sdk.svg?style=for-the-badge
[stars-url]: https://github.com/mindrunner/docker-android-sdk/stargazers
[issues-shield]: https://img.shields.io/github/issues/mindrunner/docker-android-sdk.svg?style=for-the-badge
[issues-url]: https://github.com/mindrunner/docker-android-sdk/issues
[license-shield]: https://img.shields.io/github/license/mindrunner/docker-android-sdk.svg?style=for-the-badge
[license-url]: https://github.com/mindrunner/docker-android-sdk/blob/master/LICENSE

[docker]: https://img.shields.io/badge/docker-000000?style=for-the-badge&logo=docker&logoColor=white
[Docker-url]: https://docker.io










