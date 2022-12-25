### Musl Cross-compiler

☆ Musl libc cross-compiler × _Thanks to [musl-cross-make][musl-cross-make] by [Rich Felker][richfelker]_

Current configuration in `config.mak` configuration file for [musl-cross-make][musl-cross-make].

Package|Version
--:|:--
BINUTILS|2.33.1
GCC|10.3.0
GMP|6.1.2
ISL|0.15
KERNEL|5.8.5
MUSL|git-master
MPFR|4.0.2
MPC|1.1.0

Current architecture: `arm-linux-musleabi`   
_(Set in `musl.sh`)_

Some of the available target architectures:
- `i486-linux-musl`
- `x86_64-linux-musl`
- `arm-linux-musleabi`
- `arm-linux-musleabihf`
- `sh2eb-linux-muslfdpic`

<!-- LINKS -->

[musl-cross-make]: https://github.com/richfelker/musl-cross-make

[richfelker]: https://github.com/richfelker

<!-- LINKS END -->
