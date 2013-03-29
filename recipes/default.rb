#
# Cookbook Name:: zend-server
#
#


# Add the zend server repo signature to repo list
cookbook_file "/etc/apt/sources.list.d/zend-server.list" do
  source zend_deb_repo
  mode "0644"
end

# Get the zend server repository dependencies
execute "zend-apt-gpg-key" do
  command "wget http://repos.zend.com/zend.key -O- | apt-key add -"
  action :run
end

execute "apt-get update"

# Install zend server
execute "apt-get install zend-server-php-5.4 -y"


# Install extra extensions
node[:zend_server][:extensions].each do |ext_name, actions|
  # Support literal package name 
  if node[:zend_server][:supported_extensions].include? name or (not node[:zend_server][:verify_extensions])
    package ext_name do
      action actions
    end
  # Support short-hand package names based on PHP version.
  elseif node[:zend_server][:supported_extensions].include? "php-#{node[:zend_server][:php][:version]}-#{ext_name}-zend-server"
    package "php-#{node[:zend_server][:php][:version]}-#{ext_name}-zend-server" do
      action actions
    end
  end
end
