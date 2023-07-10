# FROM：使用するイメージ、バージョン
FROM ruby:3.2.2

# 一般的な依存関係をインストール
RUN apt-get update -qq\
  && apt-get install -yq --no-install-recommends\
    build-essential\
    gnupg2\
    curl\
    less\
    git\
    vim\
  && apt-get clean\
  && rm -rf /var/cache/apt/archives/*\
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*\
  && truncate -s 0 /var/log/*log

# Rails 7ではWebpackerが標準では組み込まれなくなったので、yarnやnodejsのインストールが不要

# gemバージョン
ARG RUBYGEMS_VERSION=3.3.26

# WORKDIR：作業ディレクトリ
RUN mkdir /myapp
WORKDIR /myapp

# COPY：コピー元とコピー先を指定
# ローカルのGemfileをコンテナ内の/app/Gemfileに
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

# RubyGemsをアップデート
RUN gem update --system ${RUBYGEMS_VERSION} && \
    bundle install

COPY . /myapp

# コンテナ起動時に実行させるスクリプト
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# コンテナ実行時にデフォルトで実行するコマンド
# Rails サーバ起動
CMD ["rails", "server", "-b", "0.0.0.0"]