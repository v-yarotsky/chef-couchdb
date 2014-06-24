package "couchdb" do
  action :install
end

service "couchdb" do
  provider Chef::Provider::Service::Upstart
  supports :start => true, :stop => true, :restart => true
  action [:enable, :start]
end

cookbook_file "/etc/couchdb/local.ini" do
  owner "couchdb"
  group "couchdb"
  mode  "0640"
  source "etc/couchdb/local.ini"
  notifies :restart, "service[couchdb]"
end

