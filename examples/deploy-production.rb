# Server settings
server "81.0.240.110",  :app, :web, :db, :primary => true
set :rails_env,       'production'
set :user,            'segwaygw_bbapps_cz'
set :deploy_to,       '/var/www/segwaygw_bbapps_cz'