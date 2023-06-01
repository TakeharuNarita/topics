
# SSHで接続する サーバー編

SSHサーバーのセットアップをしたことがない方に向けた、簡単な手順を記載した記事です。

# 注意: Ubuntu環境で解説します。

  ## 目次

  - SSH接続を使用する意義
  - `openssh-server`をインストール
  - Ubuntuユーザーを作成(任意)
  - ホームディレクトリに`.ssh`作成
  - `config`関連
  - まとめ

<br>


  ## SSH接続を使用する意義

  簡単に暗号化通信を用いてリモート操作ができることです。

  クライアント編にありますので、省略します。

  [SSHで接続する クライアント編 #なぜSSH接続するのか](https://qiita.com/takegongon/items/9978fc87e35c55cfd8fb#%E3%81%AA%E3%81%9Cssh%E6%8E%A5%E7%B6%9A%E3%81%99%E3%82%8B%E3%81%AE%E3%81%8B)

<br>


  ## `openssh-server`をインストール

  勿論、入っていればこの手順は不要です。

  下記コマンドでインストール出来ます。

  ```bash
  sudo apt update
  sudo apt install openssh-server
  ```

  また、念の為アンインストールのコマンドも記載しておきます。

  ```bash
  sudo apt remove --purge openssh-server
  sudo apt autoremove
  ```

<br>


  ## Ubuntuユーザーを作成(任意)

  SSHで接続したいユーザーが既にいる場合は、この手順は不要です。

  以下のコマンドで、新しいユーザーを作成します。
  `$ADD_USER_NAME`を作成したいユーザー名に置き換えてください。

  ```bash
  sudo adduser $ADD_USER_NAME
  ```

  作成したユーザーの権限を設定します。必要に応じて、ユーザーにsudo権限を付与することもできます。

  ```bash
  sudo usermod -aG sudo $ADD_USER_NAME
  ```

  また、この後の作業は、作成したユーザーのホームディレクトリで行う為、ユーザーの切り替えを行ってください。

  ```bash
  su $ADD_USER_NAME
  ```

<br>


  ## ホームディレクトリに`.ssh`作成

  SSHで接続したいユーザーのホームディレクトリに移動して、.sshディレクトリを作成します。

  このディレクトリには、公開鍵認証に使用する鍵ファイルが格納されます。

  ```bash
  cd ~
  sudo mkdir /.ssh
  sudo chmod 700 /.ssh
  ```

  `authorized_keys`に`hogehoge.pub`を追記

  リモートから接続するためには、公開鍵認証を行う必要があります。クライアント側のマシンで生成した公開鍵を、サーバー側のauthorized_keysファイルに追加します。

  ```bash
  cd /.ssh
  sudo touch authorized_keys
  sudo chmod 600 authorized_keys
  sudo nano authorized_keys
  ```

  `nano`エディタが開いたら、クライアント側のマシンで生成した公開鍵(`作成したキー名.pub`)を貼り付けて保存します。

  これで、クライアント側のマシンからサーバーにSSH接続できるようになりました。

  ただ、このままだと、パスワード認証も可能な状態になっています。
  パスワード認証を無効にするために、sshd_configファイルを編集します。

<br>


## `config`関連

  管理者権限のアカウントに切り替えてください。
  下記のファイルを編集することで、SSH接続の設定を変更できます。

  ### `/etc/ssh/sshd_config`
  
  <br>

  下記は認証系の設定です。

  |日本語とか|変数|パラメータ|
  |-|-|-|
  |パスワードアクセス|`PasswordAuthentication`|yes, no|
  |RSA認証|`RSAAuthentication`|yes, no|
  |公開鍵認証|`PubkeyAuthentication`|yes, no|
  |ポート番号|`Port`|整数|
  |ルートログイン許可|`PermitRootLogin`|yes, no|

  <br>

  他にもこのような設定があります。

  |日本語とか|変数|
  |-|-|
  |キーボードインタラクティブ認証|`KbdInteractiveAuthentication`|
  |PAMを使う|`UsePAM`|
  |X11転送|`X11Forwarding`|
  |環境変数の受け入れ|`AcceptEnv`|
  |サブシステム|`Subsystem`|
  |TCPキープアライブ|`TCPKeepAlive`|
  |ログイン猶予時間|`LoginGraceTime`|
  |最大認証試行回数|`MaxAuthTries`|
  |最大同時セッション数|`MaxSessions`|
  |クライアントアライブ間隔|`ClientAliveInterval`|
  |クライアントアライブ最大回数|`ClientAliveCountMax`|
  |DNSを使用する|`UseDNS`|
  |許可される環境変数|`PermitUserEnvironment`|
  |圧縮|`Compression`|
  |起動制限|`MaxStartups`|
  |ログイン時のメッセージ表示|`PrintMotd`|

<br>


## まとめ


SSHサーバーのセットアップについて解説しました。

練習環境であれば、`rootログイン禁止`、`公開鍵認証(パスワード認証の禁止)`、これさえやれば、十分なのかなと思っといたりします。

最後まで読んでいただきありがとうございます。記事に誤りなどありましたら教えていただけると、とても嬉しいです！
