# RustCE
This is a proof-of-concept for running Rust on the ti-84+ce calculators

This uses [jacobly0's (e)z80 fork of LLVM](https://github.com/jacobly0/llvm-project) to transpile llvm ir outputted by rustc into asm and then uses fasmg and convbin to compile the asm into a binary

This uses the include files from the [CE-Programming toolchain](https://github.com/CE-Programming/toolchain) to get names for the syscalls

The fasmg and convbin commands are adapted from the C toolchain makefile

## Building
To build the example you need to have the [C toolchain](https://github.com/CE-Programming/toolchain) installed with the CEDEV environment variable set to the install directory

You also need to have the wasm32-unknown-unknown target installed via rustup

Then run `build.sh`