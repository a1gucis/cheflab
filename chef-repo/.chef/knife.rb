current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "#{ENV['CHEF_USER']}"
client_key               "#{ENV['CHEF_USER_PEM']}"
validation_client_name   "#{ENV['CHEF_ORGANIZATION']}-validator"
validation_key           "#{ENV['CHEF_ORGANIZATION_PEM']}"
chef_server_url          "https://#{ENV['CHEF_MASTER']}/organizations/#{ENV['CHEF_ORGANIZATION']}"
syntax_check_cache_path  "#{ENV['HOME']}/.chef/syntaxcache"
cookbook_path            ["#{current_dir}/../cookbooks"]