# config valid only for current version of Capistrano
# capistranoのバージョンを記載。固定のバージョンを利用し続け、バージョン変更によるトラブルを防止する
lock '3.16.0'

# Capistranoのログの表示に利用する
set :application, 'progress'
set :deploy_to, '/var/www/rails/progress'

# どのリポジトリからアプリをpullするかを指定する
set :repo_url,  'git@github.com:Ryohei530/progress.git'
# set :branch, "ec2-capi"

# バージョンが変わっても共通で参照するディレクトリを指定
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", "public/storage"
#バージョンが変わってもマスターキーを共有する
append :linked_files, "config/master.key"

set :rbenv_type, :user
set :rbenv_ruby, '2.7.3' #カリキュラム通りに進めた場合、2.5.1か2.3.1です
set :rbenv_custom_path, "/home/ryohei/.rbenv"

# どの公開鍵を利用してデプロイするか
set :ssh_options, auth_methods: ['publickey'],
                  keys: ['~/.ssh/ryohei.pem'] 


set :nginx_sites_available_path, "/etc/nginx/sites-available"
set :nginx_sites_enabled_path, "/etc/nginx/sites-enabled"
