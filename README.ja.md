# Homebrew-formula Faust

[faust](http://faust.grame.fr)をHomebrewでインストールするためのリポジトリです。.

## インストール

```sh

brew tap tomoyanonymous/faust

brew install faust [option]

```

## オプション、依存パッケージ

### Option

何も指定しないと、

`make all`,`make httpd`,`make sound2faust`,`make dynamic` をインストールします。

#### --with-universal

`make all`の代わりに`make universal`を使い、コンパイラをユニバーサルバイナリで出力します。

#### --with-web

標準のコンパイラに加えてasm.jsとwebassemblyコンパイラを出力します。emscriptenが依存パッケージになります。

*Emscriptenは環境変数LLVM_PATHを手動でセットする必要があります。Homebrewのインストール時のメッセージに従って設定して下さい。*

- make asmjs
- make wasm

#### --with-ios

標準のコンパイラに加えてiOS向けのコンパイラを出力します。

- make ios
- make ios-llvm

*現在compiler/Makefile.unixのasmjs, wasm, ios ,ios-llvmタスクの`CXXFLAGS`から `-I../architechture`が抜けているようで--with-webと--with-iosはそのままではビルドが通りません*

- --HEAD

[Gitリポジトリ](https://github.com/grame-cncm/faust)上の開発版、**master-dev**ブランチからビルドします。
.
### 依存パッケージ

- llvm
- openssl
- libmicrohttpd
- libsndfile
- pkg-config
- (emscripten)

## その他

- 本家のHomebrewからもFaustの開発からも非公式に作ってるので自己責任で使用して下さい。
- TODO:テスト関数


## 作者

Matsuura Tomoya

<https://matsuuratomoya.com>

## License

MIT
