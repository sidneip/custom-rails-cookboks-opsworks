node[:deploy].each do |application, deploy|
  opsworks_deploy_dir do
    user deploy[:user]
    group deploy[:group]
    path deploy[:deploy_to]
  end

  dotenv_template do
    application application
    deploy deploy
    env node[:deploy][application.to_sym][:env]
  end
end
