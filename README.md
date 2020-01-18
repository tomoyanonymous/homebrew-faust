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

This formula normally installs with llvm backend and libfaust(both of static and dynamic version).

`make all`

#### --with-universal

This makes universal binary.

#### --HEAD

Install **master-dev** branch of faust [git repository](https://github.com/grame-cncm/faust).
.
### Dependencies

- cmake
- llvm
- openssl
- libmicrohttpd
- libsndfile
- pkg-config

## other

- test function is under construction, for now, it uses [architecture-tests](https://github.com/grame-cncm/faust/tree/faust2/tests/architecture-tests).It needs SDKs such like Qt,VST to pass all tests.

- This formula is unofficial from faust developers. Please use by your own responsibility.

## Author

Matsuura Tomoya

<https://matsuuratomoya.com>

## License

MIT
