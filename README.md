# RustCE
This is a proof-of-concept for running Rust on the ti-84+ce calculators

This uses [jacobly0's (e)z80 fork of LLVM](https://github.com/jacobly0/llvm-project) to transpile llvm ir outputted by rustc into asm and then uses fasmg and convbin to compile the asm into a binary

This uses the include files from the [CE-Programming toolchain](https://github.com/CE-Programming/toolchain) to get names for the syscalls

The fasmg and convbin commands are adapted from the C toolchain makefile

# Building

## Prerequisites
Install the [CE toolchains](https://github.com/CE-Programming/toolchain)<br>
Install the wasm32-unknown-unknown target for rust<br>
Install cargo make via `cargo install --force cargo-make`
## Makefile.toml
Set `CEDEV` to your CE toolchain install directory<br>
Set `EXECUTABLE_NAME` to the name of your program

Run `cargo make ce`