# Macでの開発環境構築
> 定期的にOSのクリーンインストール・開発環境を構築するときのためのメモ

### OSインスコ後にやること
・システム環境設定 > セキュリティー＆プライバシーの
ダウンロードしたアプリケーションの実行許可をApp　Storeと確認済みの開発元からのアプリケーションを実行にチェックをつける
> カギは開けとく。( oracleのVirtual Boxを入れる際に撥ねられないようにする）

ターミナルコマンドで諸々インスコ
1.  [HomeBrew](https://brew.sh/index_ja)でコマンドインストールをコピペ。
`$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`
2. Install virtual box
`$ brew cask install virtualbox`
なんか怒られた時は`$ brew search virtualbox`して存在しているのか確認
3. Install Vagrant 
`$ brew cask install virtualbox`
4. php のばーじょんあっぷ
`$ php -v` して7.4だったらこの項目はスキップ
---7.4より古かったら
`$ brew search php@7` するとphp@7.4があるはずなので、`$ brew install php@7.4`する
インストールが終わってバックグラウンドでphp-fpmをDLしてるね〜ってなったらパスを通しておく
```
$ echo 'export PATH="/usr/local/opt/php@7.4/bin:$PATH"' >> ~/.bash_profile
$ echo 'export PATH="/usr/local/opt/php@7.4/sbin:$PATH"' >> ~/.bash_profile
```
パスを通したら
`$ brew services start php`
起動したら一旦クローズする
`$ exit`
# 一旦クローズする、ぜったい。
再度ターミナルを立ち上げたらインストール出来たか確認
`$ php -v` 7.4になっていればおk

続きはこちら[https://github.com/TKHS8203/zen_dev.local](https://github.com/TKHS8203/zen_dev.local)



> Written with [StackEdit](https://stackedit.io/).
