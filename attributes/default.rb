#
#
#

# Major version of PHP to install
default['zend_server']['php']['version'] = '5.4'

# Additional extensions to install
default['zend_server']['extensions'] = {
    'extra-extensions' => [:install]
}

# Should we verify extensions before we try to install them?
default['zend_server']['verify_extensions'] = true

# Array of supported Zend Server extensions for PHP 5.4
#  (This defines supported behavior. If you change it, things might break.)
default['zend_server']['supported_extension'] = [
    'php-5.4-extra-extensions',
    'php-5.4-mssql-zend-server',
    'php-5.4-gmp-zend-server',
    'php-5.4-wddx-zend-server',
    'php-5.4-memcache-zend-server',
    'php-5.4-xmlrpc-zend-server',
    'php-5.4-odbc-zend-server',
    'php-5.4-pdo-odbc-zend-server',
    'php-5.4-imagick-zend-server',
    'php-5.4-pdo-dblib-zend-server',
    'php-5.4-unix-extensions-zend-server',
    'php-5.4-ssh2-zend-server',
    'php-5.4-memcached-zend-server',
    'php-5.4-mongo-zend-server'
]
