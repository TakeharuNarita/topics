
# SSHのキーを作る

  ## `.ssh`ディレクトリの作成

  役割：SSHキーを格納しておきます
  `~/.ssh/`ディレクトリが存在しない場合は作成します。

<br>

  ## SSHキーの生成

  以下のコマンドを実行し、SSHキー（公開鍵と秘密鍵のペア）を生成します。

  ```bash
  ssh-keygen -f ~/.ssh/接続先がわかるファイル名
  ```

  `-f`はファイル名を指定しています。無しにすると色々聞かれてセットアップが長引きます。

  **パスフレーズ**を省略したい場合は、空欄のままEnterキーを押してください。


  ## key共有

  公開鍵である`~/.ssh/接続先がわかるファイル名.pub`を共有してください<br>
  **`.pub`がついてない秘密鍵は漏洩厳禁**です、万が一漏洩したらすぐにそのキーの接続をサーバー側でブロックします。


<br>


# 接続する

  ## ssh接続コマンド

  ホームディレクトリにいる前提です
  ```bash
  cd .ssh
  ssh -i プライベートキーのパス アクセス先のユーザー名@サーバーのIPかドメイン -p ポート
  ```

  |コマンド|意味|
  |-|-|
  |`-i`|は`key`を使ってアクセスすることを意味します。当然`キーのファイル`が必要なので引数に`キーのパス`|
  |`-p`|ポートを指定します。このオプション無しだとデフォルトの`:22`になります。不正アクセスも22ポートめがけて行われる事が多いため、意図的にずらす事をした場合、必須です。|

 接続を終了する時は`exit`と打ってください。


<br>


# ファイルの転送

SCPやSFTPを使用すると簡単にファイル転送ができます。SSH接続している場合は一旦`exit`でSSH接続を終了してください。


<br>

  ## 1. SCP（Secure Copy）

  ### リモートコンピュータからローカルコンピュータへのファイル転送

  ```bash
  scp ユーザー名@リモートホスト名またはIPアドレス:リモートファイルのパス ローカルに保存するディレクトリ
  ```


<br>


  ### ローカルコンピュータからリモートコンピュータへのファイル転送

  ```bash
  scp ローカルファイルのパス ユーザー名@リモートホスト名またはIPアドレス:リモートに保存するディレクトリ
  ```


<br>

  ### sshを開始する時と同じです

  ただ、オプションは前に持ってきてください
  リモートに転送の場合、

  ```bash
  ssh -i プライベートキーのパス アクセス先のユーザー名@サーバーのIPかドメイン -p ポート
  ```

  このように接続していたのなら、、

  ```bash
  scp -i プライベートキーのパス -P ポート ローカルファイルのパス ユーザー名@リモートホスト名またはIPアドレス:リモートに保存するディレクトリ
  ```

  `scp`する時のコマンドはこのようになります。

**※scpの際`-P`は大文字です**


<br>


  ## 2. SFTP（SSH File Transfer Protocol）

  SFTPは、SSHプロトコルを利用したファイル転送プロトコルです。対話型のインターフェイスでファイル転送を行うことができます。
  連続でファイルのやり取りを行いたい時などに便利です。


<br>

  ### SFTPセッションの開始

  ```bash
  sftp -i プライベートキーのパス -p ポート ユーザー名@リモートホスト名またはIPアドレス
  ```


<br>

  ### リモートコンピュータからローカルコンピュータへのファイル転送

  ```bash
  get リモートファイルのパス ローカルに保存するディレクトリ
  ```


<br>

  ### ローカルコンピュータからリモートコンピュータへのファイル転送

  ```bash
  put ローカルファイルのパス リモートに保存するディレクトリ
  ```


<br>

  ### SFTPセッションの終了

  ```bash
  exit
  ```

<br>

