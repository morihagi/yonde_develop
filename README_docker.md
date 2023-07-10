# Version
* Ruby version
3.2.2

* Rails
7.0.6

* Database
SQlite3

# Run
1. ターミナルを起動
2. 好みの場所にリポジトリを作成し、移動
    ```
    mkdir なんとかなんとか/new_app
    cd なんとかなんとか/new_app
    ```
3. アプリのリポジトリに下記をgit clone
    ```
    git clone https://github.com/morihagi/docker_rails_new_sqlite3.git
    ```
4. rails new
    ```
    docker compose run --no-deps web rails new . --force --skip-test --skip-bundle
    ```
    新しくコンテナが起動して勝手に止まります。メインのコンテナの中に入れたら削除してOKです。
5. gemのインストール
    ```
    docker compose run --no-deps web bundle install --path vendor/bundle
    ```
    新しくコンテナが起動して勝手に止まります。メインのコンテナの中に入れたら削除してOKです。
6. Dockerコンテナを作る&起動
    ```
    docker compose build -d
    ```
    この時点から`http://localhost:3000/`にアクセスできます。
7. Dockerコンテナに入る
    ```
    docker compose exec web bash
    ```
    root@なんちゃらかんちゃら:/app#みたいなのが表示されればコンテナに入れてます。
11. コンテナの中から開発を進める
    ```
    root@なんちゃらかんちゃら:/app# rails db:create
    root@なんちゃらかんちゃら:/app# bundle install
    ```
    このようにいつものrailsのコマンドが使えます。
8.  その他
    - コンテナ内のコマンド例
        ```
        root@なんちゃらかんちゃら:/app# rails db:create
        ```
    - gemをインストールして、サーバーを再起動したい時
        ```
        # コンテナの外から実行
        docker compose exec web bundle exec rails restart
        ```
    - 全コンテナの停止
        ```
        docker stop $(docker ps -q)
        ```
        `docker compose up -d`で再起動
    - コンテナの削除
        ```
        docker compose down
        ```
        `docker compose up -d`で復活
