remote_file "/tmp/tzdata_2019c-3_all.deb" do
  source "http://security.ubuntu.com/ubuntu/pool/main/t/tzdata/tzdata_2019c-3_all.deb"
  mode 0644
  action :create
end

dpkg_package "tzdata" do
  source "/tmp/tzdata_2019c-3_all.deb"
  puts 't' 
  action :install
end