<!--
## 環境構築 for Mac OS X

### 前提

- git コマンドが利用出来ること
- Xcode と、Xcodeコマンドラインツールが利用出来ること<br>
  （Xcodeインストール後 `xcode-select --install` でインストール）
- openssl, libyaml ライブラリがインストールされていること（rubyのコンパイルで必要）<br>
  （brew なら `brew install openssl libyaml` でインストール）

### rbenv + ruby-build のインストール

```sh
$ brew update
$ brew install rbenv ruby-build

$ echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
$ source ~/.bash_profile
```

### ruby のインストール

ruby 2.2.0 をインストール

```sh
$ rbenv install 2.2.0
```

デフォルトで 2.0.0 が使用されるように設定

```sh
$ rbenv global 2.2.0
```

### bundler のインストール

```sh
$ gem install bundler
```
-->

```
$ cd PROJECT_ROOT_DIR
$ bundle install --path vendor/bundle
```
