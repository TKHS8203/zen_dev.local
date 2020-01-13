# Web development environment
##  開発の流れ
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
・node  version : v12.7.0
・npm version : 6.10.3
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

ここまで終わったら、vagrant に環境をクローン

!! 開発環境を入れるディレクトリ（容量やread writeが早い場所、SSDとか）に移動してから
`$ cd /Volumes/[USER NAME]/zen_dev.local/sites/`
`$ git clone https://github.com/TKHS8203/zen_dev.local.git`
`$ cd zen_dev.local`
`$ vagrant up`
※開発環境を入れるディレクトリはgit cloneするとzen_dev.localというディレクトリが作られます。
### プロジェクトが始まったら行うこと
- リポジトリのクローン
	-  sourceTree のNew... > Clone from URLから付与されたリポジトリのURLを入力、Destination Pathはプロジェクトを置くディレクトリに
	- またはシェルで直接`/Volumes/[USER NAME]/zen_dev.local/sites/`上で
	`$ git clone https://github.com/TKHS8203/[PROJECT NAME].dev.local.git`
- node package module / webpackなどをインストール
  - `$ cd [PROJECT NAME].dev.local`
  - `$ npm install` or `$ npm i`
  - ※ターミナル上でエラーを吐いていたら教えてください。何らかのパッケージがインストールできなかったり環境が違う可能性があります。
- 当日、または自分がコミットする前にSourceTreeでフェッチをしましょう。更新があるとプルを促してくれます。コンフリクトしたときは呼んでください。
