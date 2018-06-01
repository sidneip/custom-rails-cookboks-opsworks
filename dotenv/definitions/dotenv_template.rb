define :dotenv_template do
  template "#{params[:deploy][:deploy_to]}/shared/config/dotenv" do
    source "env.erb"
    owner params[:deploy][:user]
    group params[:deploy][:group]
    mode "0660"
    variables :env => params[:env]
  end
end
