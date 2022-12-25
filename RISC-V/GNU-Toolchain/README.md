### RISC-V 

[RISC-V GNU Toolchain][riscv-gnu-toolchain] by [RISC-V Software Collaboration][riscv-collab] for [RISC-V][riscv] architecture

**WARNING**: git clone within the GNU RISC-V Toolchain takes around 6.65 GB of disk and download size

Dependencies _(Debian)_

- autoconf
- automake
- autotools-dev
- libmpc-dev
- libmpfr-dev
- libgmp-dev
- libtool
- zlib1g-dev
- libexpat-dev
- curl
- python3
- gawk
- build-essential
- bison
- flex
- texinfo
- gperf
- patchutils
- bc

If you have started a new GitHub Codespace Debian container, run the command below to be able to build the GNU RISC-V Toolchain.

```bash
sudo apt-get update -y && \
sudo apt-get install -y autoconf automake autotools-dev curl python3 \
libmpc-dev libmpfr-dev libgmp-dev libtool zlib1g-dev libexpat-dev \
gawk build-essential bison flex texinfo gperf patchutils bc
```

Working configuration _(At the moment anyway)_

```bash
BINUTILS_VER = 2.33.1
GCC_VER = 10.3.0
MUSL_VER = git-master
GMP_VER = 6.1.2
MPC_VER = 1.1.0
MPFR_VER = 4.0.2
ISL_VER = 0.15
LINUX_VER = 5.8.5
```

<!-- LINKS -->

[riscv-gnu-toolchain]: https://github.com/riscv-collab/riscv-gnu-toolchain

[riscv-collab]: https://github.com/riscv-collab

[riscv]: https://github.com/riscv

<!-- LINKS END -->
