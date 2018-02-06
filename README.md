# Homebrew-formula Faust

[日本語](./README.ja.md)

This is the tap repository for homebrew [faust](http://faust.grame.fr).

## Installation

```sh

brew tap tomoyanonymous/faust

brew install faust [option]

```

## Options and Dependencies

### Option

This normally installs with

`make all`,`make httpd`,`make sound2faust`,`make dynamic`

#### --with-universal

This use `make universal` instead of `make all` to make universal binary.

#### --with-web

This option installs asmjs compiler and wasm compiler after above(depends on emscripten)

*Emscripten needs to set environment variable LLVM_PATH manually, Please follow the instruction in an installation.*

- make asmjs
- make wasm

#### --with-ios

- make ios
- make ios-llvm

*Currently `-I../architechture` in `CXXFLAGS` of tasks; asmjs, wasm, ios and ios-llvm are seems to be missing.*

- --HEAD

Install **master-dev** branch of faust [git repository](https://github.com/grame-cncm/faust).
.
### Dependencies

- llvm
- openssl
- libmicrohttpd
- libsndfile
- pkg-config
- (emscripten)

## other

- test function is under construction, for now, it uses [architecture-tests](https://github.com/grame-cncm/faust/tree/faust2/tests/architecture-tests).It needs SDKs such like Qt,VST to pass all tests.

- This formula is unofficial from faust developers. Please use by your own responsibility.

## Author

Matsuura Tomoya

<https://matsuuratomoya.com>

## License

MIT
