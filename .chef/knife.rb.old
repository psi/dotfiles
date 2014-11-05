current_dir = Dir.pwd
home_dir    = ENV['HOME']

region = ENV['REGION'] || 'us-east-1'
server = ENV['KNIFE_SERVER_NAME'] || 'chef11'
user   = ENV['KNIFE_USER'] || ENV['USER']

log_level                 :info
log_location              STDOUT
node_name                 user
client_key                "#{home_dir}/.chef/credentials/#{server}-#{user}.pem"
validation_client_name    "chef-validator"
validation_key            "#{home_dir}/.chef/credentials/#{server}-validator.pem"
chef_server_url           "https://#{ENV['CHEF_SERVER'] || server}.s--e.net"
syntax_check_cache_path   "#{home_dir}/.chef/syntax_check_cache"
cookbook_path             ['./cookbooks']
encrypted_data_bag_secret "#{current_dir}/.chef/encrypted_data_bag_secret"

ami_config_file = File.expand_path("#{current_dir}/config/ami.yml")

if File.exists?(ami_config_file)
  ami_config = YAML.load_file(ami_config_file)
  knife[:image]  = ami_config[region]
end

knife[:region] = region

knife[:aws_ssh_key_id]        = ENV['AWS_SSH_KEY_ID']
knife[:aws_access_key_id]     = ENV['AWS_ACCESS_KEY_ID']
knife[:aws_secret_access_key] = ENV['AWS_SECRET_ACCESS_KEY']

#knife[:secret_file] = "#{current_dir}/.chef/encrypted_data_bag_secret"
knife[:ssh_attribute] = "fqdn"
