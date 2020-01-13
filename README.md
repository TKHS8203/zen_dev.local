# Web development environment
##  開発の流れ
#### ローカル
・VirtualBox上でVagrantを起動、指定のディレクトリ下にあるファイルをエディターでhtml / php / css / JSをごにょごにょしていく
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
`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
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
