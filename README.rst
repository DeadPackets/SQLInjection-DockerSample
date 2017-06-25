Docker Sample for SQL Injection
===============================

SQLインジェクション実践のためにフォームがあるアプリと、データベースをphpmyadminのセット。
まずダウンロードしてビルド、そしてアップ。

  $ docker-compose build
  $ docker-compose up -d

* アプリ: http://localhost:8686/select
* DB(ID:root pw:): http://localhost:8687/

  $ docker run -d -p 80:80 --name sql_inj matoba/sql_injection

商品を分類で絞って表示するようなシステムを想定している。フォームに"toy"と入れてEnterを押すと、それに対応したレコードが出てくる。そのフォームに下記の内容を入れてEnterを押すと、見えてほしくないテーブルの情報が表示される。

  toy';SELECT * FROM users WHERE id <> '
