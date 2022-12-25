# syntax=docker/dockerfile:1
# Victor-ray, S. <12261439+ZendaiOwl@users.noreply.github.com>
FROM fedora:38
RUN dnf update -y && dnf install -y patch make gawk wget curl git cronie \
    xz pxz tar zip bzip2 texinfo bison flex ncurses coreutils diffutils findutils \
    grep gzip tar sed ncurses-term ncurses-base ncurses-libs \
    boost-build build2 ncdu colorize nano \
    rsync gcc libgcc gcc-aarch64-linux-gnu bash gcc-c++ \
    libstdc++ glibc gmp-devel libmpc-devel mpfr-devel cloog-devel isl-devel && dnf clean all
