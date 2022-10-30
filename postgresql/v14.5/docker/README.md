# PostgreSQL on Docker

## 構築方法

### 1. 必要なディレクトリを作る（存在しない場合・初回のみ）

```bash
$ mkdir postgresql_data
```

### 2. ユーザー名とパスワードを設定する
- `.envrc` (`direnv`) で設定する
  - `direnv` が入っていない環境では直接環境変数を渡すか、`docker-compose.yml` 内に直書きする

### 3. コンテナ名を決める
- `docker-compose.yml` の `container_name` を変更する

### 4. ポート番号を決める
- `docker-compose.yml` の `ports` を変更する

### 5. （任意）パスワード無しで接続できるようにする（非推奨）
- `docker-compose.yml` の `environment` に以下の値をセットする
  ` - POSTGRES_HOST_AUTH_METHOD: trust`

### 6. （参考）初期ユーザーのデータベース作成権限について
- MySQLとは違い、PostgreSQL では `POSTGRES_USER` にデータベース作成権限がある
- 細かい起動時オプションは [公式ドキュメント](https://hub.docker.com/_/postgres) に詳しく記載がある

## 参考資料

### 最新イメージの場所
- https://hub.docker.com/_/postgres
  - https://hub.docker.com/_/postgres/tags

### コンテナの中に入る方法

```bash
$ docker exec -it container_name psql -h localhost -U USERNAME
```

### 接続チェック
- `127.0.0.1` は `localhost` でも可

#### pgcli コマンドで接続

```bash
$ PGPASSWORD=YOUR_POSTGRES_PASSWORD pgcli -h 127.0.0.1 -U USERNAME -p 23456
```

### （参考）ローカルに直接インストールした場合の設定ファイルの場所

- `/etc/postgresql/VERSION_NUMBER/main`

### （参考）ローカルに直接インストールした場合のデータファイルの場所
- 要権限
- `/var/lib/postgresql/VERSION_NUMBER/main`
