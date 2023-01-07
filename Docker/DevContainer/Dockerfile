# syntax=docker/dockerfile:1
# Victor-ray, S. <12261439+ZendaiOwl@users.noreply.github.com>
# rm -rf /var/lib/{apt,dpkg,cache,log}/
# DEBIAN_FRONTEND=noninteractive
# DEBIAN_FRONTEND=newt
FROM mcr.microsoft.com/devcontainers/base:bullseye
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y; \
apt-get install -y bash g++ make gawk autoconf automake autotools-dev curl python3 \
python3-pip wget binutils xz-utils texinfo libncursesw5-dev rsync git \
libmpc-dev libmpfr-dev libgmp-dev libtool zlib1g-dev libexpat-dev \
build-essential bison flex texinfo gperf patchutils bc shellcheck; \
apt-get clean -y; \
rm -rf /var/lib/apt/lists/*
SHELL ["/bin/bash", "-c"]
RUN curl --silent "https://getmic.ro" | bash; mv ./micro /usr/bin/
RUN curl --silent -o- "https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh" | bash; . /root/.bashrc; nvm install --lts
RUN curl --silent "https://get.sdkman.io" | bash; . /root/.bashrc; sdk install java; sdk install kotlin
ENV DEBIAN_FRONTEND=newt
