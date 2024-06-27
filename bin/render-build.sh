# render用のファイルを生成する
set -o errexit

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean