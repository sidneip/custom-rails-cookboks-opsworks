node[:deploy].each do |application, deploy|
  # write out .env file
  template "#{deploy[:deploy_to]}/current/.env" do
    source 'env.erb'
    mode '0660'
    owner deploy[:user]
    group deploy[:group]
    variables(
      :env => deploy[:environment_variables]
    )
  end
end