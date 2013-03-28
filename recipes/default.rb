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


# Extra extensions
# php-5.4-mssql-zend-server, php-5.4-gmp-zend-server, php-5.4-wddx-zend-server, php-5.4-memcache-zend-server, php-5.4-xmlrpc-zend-server, php-5.4-odbc-zend-server, php-5.4-pdo-odbc-zend-server, php-5.4-imagick-zend-server, php-5.4-pdo-dblib-zend-server, php-5.4-unix-extensions-zend-server, php-5.4-ssh2-zend-server, php-5.4-memcached-zend-server, php-5.4-mongo-zend-server