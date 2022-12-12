# SSL 対応

# server.crt と server.key
- `server.crt` と `server.key` と `root.crt` を `postgresql_data` に入れる
- chmod する
  - `$ chmod 644 server.crt && chmod 644 root.crt && chmod 600 server.key`
- 必要に応じて chown する

# postgresql.conf
- `ssl = on` を追記
- `ssl_ca_file = 'root.crt'` を追記
- postgresql_data に入れる
- 必要に応じて chown する

# pg_hba.conf
- 既存のアクセス許可をすべてコメントアウトする
- アクセス許可として `hostall all all 0.0.0.0/0 cert` を最下行に書く
- 必要に応じて chown する

# Docker を再起動する
- docker compose down
- docker compose up -d

# （参考）クライアント側
- クライアント側では以下の 3つ のファイルが必要になる
  - `client.crt`
  - `client.key`
  - `root.crt`
    - ルートCAの証明書についてはサーバと共通
- 接続時の設定は `.envrc` のサンプルファイルに書いてあるとおり
  - Rails の場合は似たような名前の key の設定値を `config/database.yml` に書く
