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
HEAD version is compatible for latest llvm, so I'll fix in next release of faust.

- --with-faust0

install faust0. Dependency is only pkg-config.

- --HEAD

install head version of faust [git repository](https://github.com/grame-cncm/faust).
Normally head of **faust2 branch** will be installed.
if --with-faust0 option is also taken, head of **master branch** willbe installed.

### Dependencies

- llvm@3.8(only faust2)
Temporarily version of llvm is 3.8 because stable version(v2.1.0) is not compatible for latest "llvm" formula(4.0.1).
HEAD version is compatible for latest llvm, so I'll fix in next release of faust.

- openssl(only faust2)

- pkg-config

## other

- Other options like devel-release or --with-microhttpd option is under construction.
- Building of llvm will take time about over an hour.
- This formula is unofficial from faust developpers. Please use by your own responsibility.

## Author

Matsuura Tomoya

<https://matsuuratomoya.com>

## Lisence

MIT
