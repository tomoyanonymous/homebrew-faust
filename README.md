# Homebrew-formula Faust

This is the tap repository for homebrew [faust](http://faust.grame.fr).

## Installation

```sh

brew tap tomoyanonymous/faust 

brew install faust [option]

```

## Options and Dependencies

### Option

Faust has 2 major version, faust0 and faust2. In this formula, normally faust2 will be installed.
Only faust2 depends on **llvm** and **openssl**.

- --with-httpd

Install with httpd option. depends on libmicrohttpd.

- --with-sound2faust

Install with sound2faust. depends on libsndfile.

- --with-faust0

Install faust0. Dependency is only pkg-config.

- --HEAD

Install head version of faust [git repository](https://github.com/grame-cncm/faust).
Normally head of **faust2 branch** will be installed.
if --with-faust0 option is also taken, head of **master branch** willbe installed.

- --devel

Install master-dev branch. only compatible --with-faust0.

### Dependencies

- llvm@3.8(only faust2)
Temporarily version of llvm is 3.8 because stable version(v2.1.0) is not compatible for latest "llvm" formula(4.0.1).
HEAD version is compatible for latest llvm, so I'll fix in next release of faust.

- openssl(only faust2)
- libmicrohttpd(only --with-httpd)
- libsndfile(only --with-sound2faust)
- pkg-config

## other

- test function is under construction, for now, it uses [architecture-tests](https://github.com/grame-cncm/faust/tree/faust2/tests/architecture-tests).It needs SDKs such like Qt,VST to pass all tests.
- Building of llvm will take time about over an hour.
- This formula is unofficial from faust developpers. Please use by your own responsibility.

## Author

Matsuura Tomoya

<https://matsuuratomoya.com>

## Lisence

MIT
