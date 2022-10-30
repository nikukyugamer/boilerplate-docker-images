# MySQL on Docker

## 構築方法

### 1. 必要なディレクトリを作る（存在しない場合・初回のみ）

```bash
$ mkdir conf.d
$ mkdir init_scripts
$ mkdir mysql_data
```

### 2. ユーザー名とパスワードを設定する
- `.envrc` (`direnv`) で設定する
  - `direnv` が入っていない環境では直接環境変数を渡すか、`docker-compose.yml` 内に直書きする

### 3. コンテナ名を決める
- `docker-compose.yml` の `container_name` を変更する

### 4. ポート番号を決める
- `docker-compose.yml` の `ports` を変更する

### 5. （任意）conf.d を編集する
- 必要ならば `conf.d/my.cnf` を編集する

### 6. （任意）データベース名を決める
- `docker-compose.yml` の `MYSQL_DATABASE` を変更する（コメントアウトを外す）

### 7. （任意）起動時スクリプトを追加する
- `./init_scripts` にスクリプトを追加する
  - 接頭語の数値の順番に実行されるのでファイルの分割管理が便利

## 参考資料

### 最新イメージの場所
- https://hub.docker.com/_/mysql

### コンテナの中に入る方法

```bash
$ docker exec -it YOUR_mysql mysql -uroot -pfoobar
```

### 接続チェック
- `127.0.0.1` は `localhost` でも可

#### mysql コマンドで接続

```bash
$ mysql -h 127.0.0.1 -u USERNAME -P 12345 -p
```

#### mycli コマンドで接続

```bash
$ mycli -h 127.0.0.1 -u USERNAME -P 12345
```
