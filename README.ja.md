# Homebrew-formula Faust

[faust](http://faust.grame.fr)をHomebrewでインストールするためのリポジトリです。

## インストール

```sh

brew tap tomoyanonymous/faust

brew install faust [option]

```

## オプション、依存パッケージ

### Option

何も指定しないと、

`make all`でインストールします。llvmバックエンドのlibfaustもインストールします。

#### --with-universal

`make universal`を使い、コンパイラをユニバーサルバイナリで出力します。

#### --HEAD

[Gitリポジトリ](https://github.com/grame-cncm/faust)上の開発版、**master-dev**ブランチからビルドします。
.
### 依存パッケージ

- cmake
- llvm
- openssl
- libmicrohttpd
- libsndfile
- pkg-config

## その他

- 本家のHomebrewからもFaustの開発からも非公式に作ってるので自己責任で使用して下さい。
- TODO:テスト関数


## 作者

Matsuura Tomoya

<https://matsuuratomoya.com>

## License

MIT
