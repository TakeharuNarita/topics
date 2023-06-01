# gpg コマンドの使い方
  `gpg` は、GNU Privacy Guard（GnuPG）としても知られる暗号化ソフトウェアで、OpenPGP規格を使用してファイルやメッセージを暗号化、復号化、署名、検証するために使用されます。以下に `gpg` の一般的な使用法をいくつか示します。

  ## 1. キーの生成

    ```
    gpg --full-generate-key
    ```

    このコマンドを実行すると、キーの種類やサイズ、有効期限などの設定ができます。`--full-generate-key` 以外にも、より簡単なオプション `--generate-key` を使用することもできます。
  
  ## 2. 公開鍵のエクスポート

    ```
    gpg --output pubkey.gpg --armor --export user@example.com
    ```

    このコマンドを実行すると、`user@example.com` というユーザーの公開鍵が `pubkey.gpg` というファイルに ASCII Armor 形式でエクスポートされます。

  ## 3. 暗号化

    ```
    gpg --encrypt --recipient user@example.com file.txt
    ```

    このコマンドを実行すると、`file.txt` というファイルが `user@example.com` というユーザーの公開鍵で暗号化されます。暗号化されたファイルは、 `file.txt.gpg` という名前で保存されます。

  ## 4. 復号化

    ```
    gpg --decrypt file.txt.gpg
    ```

    このコマンドを実行すると、`file.txt.gpg` というファイルが復号化され、元のファイルである `file.txt` が生成されます。

  ## 5. 署名

    ```
    gpg --sign file.txt
    ```

    このコマンドを実行すると、`file.txt` というファイルに署名されます。署名されたファイルは、 `file.txt.asc` という名前で保存されます。

  ## 6. 署名の検証

    ```
    gpg --verify file.txt.asc
    ```

    このコマンドを実行すると、`file.txt.asc` というファイルが検証され、署名が有効であることが確認されます。

<br>

詳細な使用法については、`man gpg` を参照

