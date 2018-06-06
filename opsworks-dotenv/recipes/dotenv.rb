# import JSON custom config into .env to emulate ENV
# example:
# {
#   "deploy": {
#     "app_name" {
#       "app_env": {
#         "DATABASE_URL": "",
#         "bar": "foo"
#       }
#     }
#   }
# }

require 'shellwords'
node[:deploy].each do |application, deploy|
  rails_env = deploy[:rails_env]
  
  opsworks_deploy_dir do
    user deploy[:user]
    group deploy[:group]
    path deploy[:deploy_to]
  end

  opsworks_rails do
    deploy_data deploy
    app application
  end

  environment_variables = deploy[:app_env].to_h.merge(deploy[:environment_variables].to_h)

  file("#{deploy[:deploy_to]}/shared/.env") do
    mode '0755'
    owner deploy[:user]
    group deploy[:group]
    action :create_if_missing
  end

  open("#{deploy[:deploy_to]}/shared/.env", 'w') do |f|
    require 'yaml'
    environment_variables.each do |name, value|
      f.puts "#{name}=#{value.to_s.shellescape}"
    end
  end  
end
