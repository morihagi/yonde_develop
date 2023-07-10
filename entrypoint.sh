#!/bin/bash
set -e # エラーが発生するとスクリプトを終了する意味

# server.pid が存在するとサーバーが起動できない対策のために server.pid を削除するように設定
rm -f /myapp/tmp/pids/server.pid

# DockerfileのCMDで渡されたコマンド（Railsサーバー起動）を実行
exec "$@"
