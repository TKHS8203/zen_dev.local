# Web development environment
##  開発の流れ
・仮想環境を構築して、GitHubから環境をクローン。
・webpackでファイルやデータを生成する

#### ローカル
・VirtualBox上でVagrantを起動、指定のディレクトリ下にあるファイルをエディターでhtml / php / css / JSをごにょごにょしていく。
・CSSはSASSで書きます。
SASSやJSのコンパイル・圧縮をするため webpackを使用
・デグレすると怖いのでバージョン管理しています。
[ぎっとはぶ](https://github.com/)でアカウントの作成をお願いいたします。

#### 社内・クライアントさん確認をしてもらう
#### サーバーへ公開

## things to do.
・インストールするもの
- visual studio code [vsc](https://azure.microsoft.com/ja-jp/products/visual-studio-code/) またはatom[ATOM](https://atom.io/)  
>※どちらでも問題ない、vscがおすすめです。
※ editor configプラグインは必須

- sourcetree [sourcetree](https://www.sourcetreeapp.com/) 
[ バージョン管理ソフト（Git）納品データなどはこちらでコンフリクト回避しながら運用してます。 ] 
 
__ 環境の同期 __

・node  version : v12.18.2
・npm version : 6.14.5
※ node / npmはOSに入っているものを上書きしないよう、下記home brew経由でnode npm等のバージョンをあげてください。（プロジェクトによってはnode / npmバージョンを変更する必要ある） 
## for mac.
### Install homebrew
`$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
・homebrew で nodeをインストール
`$ brew install nodebrew`
参考URL [Qiita nodebrew でバージョン指定インストール](https://qiita.com/mame_daifuku/items/373daf5f49ee585ea498)
"インストールのバージョンは __ 環境の同期 __ を参照ください"
### Install VirtualBox & Vagrant.
-  [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
-  [Vagrant](https://www.vagrantup.com/downloads.html)
※Vagrantより最新のvirtualBoxをインストールすると何故かvagrant側がvirtualBoxを認識しないので、いっこ前のvirtualBoxをインストールをする。
2020/08現在はvirtualbox 6.0を推奨

### set proxy auto-configuration
.proxy.pac というファイル名で以下を保存  場所は [file:///Users/ユーザー名/.proxy.pac]
```bash
function FindProxyForURL(url, host) {
	if (shExpMatch(host, "*.dev.local")) {
	return "PROXY 10.0.1.4";
} else if(shExpMatch(host, "*.local")) {
	return "PROXY 10.0.1.4";
}
	return "DIRECT";
}
```
システム環境設定 > ネットワーク > Wi-FiやEthernetなど接続している方の右下にある詳細ボタンからプロキシを選択、`自動プロキシ構成`にチェック。URLは先ほど保存した場所に設定します。
## for win.
windows ではXAMPPを使用
phpのバージョンは7.4に揃えておきたいので以下を参考にしてください。
（よく使うレンサバが7.4なので）
[# xamppで複数のバージョンのphpを切り替えて使いたい](https://qiita.com/shie2/items/65234ffb6753e277d621)
 node バージョン管理（ライブラリの指定はないです）
 ここではnvm-windowsのバージョン指定を記載しておきます
 [# nvm-windowsでNode.jsのバージョン管理をする](https://cartman0.hatenablog.com/entry/2019/03/29/nvm-windows%E3%81%A7Node.js%E3%81%AE%E3%83%90%E3%83%BC%E3%82%B8%E3%83%A7%E3%83%B3%E7%AE%A1%E7%90%86%E3%82%92%E3%81%99%E3%82%8B)
 
## start up.

ここまで終わったら、環境をクローン
!! 開発環境を入れるディレクトリ（容量やread writeが早い場所、SSDとか）に移動してから
`$ cd /Volumes/[USER NAME]/開発環境を入れたい場所/`
`$ git clone https://github.com/TKHS8203/zen_dev.local.git`
`$ cd zen_dev.local`
`$ vagrant up`
※開発環境を入れるディレクトリはgit cloneするとzen_dev.localというディレクトリが作られます。

## phpmyadmin バージョンアップ
phpmyadminは$vagrant upした時最新版のものがインストールされる訳ではないのでphp7.4でぬるっと動くバージョンを入れる。
`$ vagrant ssh`
`$ sudo service mysql stop`
`$ cd /usr/share`
`$ /usr/share $ sudo mv phpMyAdmin phpMyAdmin.old`

`$ sudo wget https://files.phpmyadmin.net/phpMyAdmin/4.9.5/phpMyAdmin-4.9.5-all-languages.zip`

`$ sudo unzip phpMyAdmin-4.9.5-all-languages.zip`
// unzipないって言われたら
`$ sudo apt-get install unzip`
`$ sudo mv phpMyAdmin-4.9.5-all-languages phpmyadmin`

`$ sudo rm phpMyAdmin-4.9.5-all-languages.zip`

`$ sudo chmod -R 775 phpmyadmin`

`$ sudo service mysql start`
`$ sudo service apache start`
// serviceのstartがここでできなくてもOK
vargrant sshをexitしたら`$ vagrant reload`で再起動
念の為phpmyadmin内のバージョンは確認して　4.9.5になっていたら終了

### プロジェクトが始まったら行うこと
- リポジトリのクローン
	-  sourceTree のNew... > Clone from URLから付与されたリポジトリのURLを入力、Destination Pathはプロジェクトを置くディレクトリに
	- またはシェルで直接`/Volumes/[USER NAME]/zen_dev.local/sites/`上で
	`$ git clone https://github.com/TKHS8203/[PROJECT NAME].dev.local.git`
- node package module / webpackなどをインストール
  - `$ cd [PROJECT NAME].dev.local`
  - `$ cd _dev`
  - `$ npm install` or `$ npm i`
  - ※ターミナル上でエラーを吐いていたら教えてください。何らかのパッケージがインストールできなかったり環境が違う可能性があります。
- 当日、または自分がコミットする前にSourceTreeでフェッチをしましょう。更新があるとプルを促してくれます。コンフリクトしたときは呼んでください。
  - ターミナルでは`$ git fetch` またはそのまま`$ git pull`
  - gitにプッシュするときは `$ git add --all` [Enter ->] `$ git commit -m'some commit message'` [Enter ->] `$ git push`
