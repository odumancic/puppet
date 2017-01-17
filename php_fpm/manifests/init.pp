class php_fpm {

  case $::operatingsystemmajrelease {
    '7': {
      $epel_path = "https://dl.fedoraproject.org/pub/epel/epel-release-latest-${::operatingsystemmajrelease}.noarch.rpm"
      $php_repo_path = "https://mirror.webtatic.com/yum/el${::operatingsystemmajrelease}/webtatic-release.rpm"
    }
    '6': {
      $epel_path = "https://dl.fedoraproject.org/pub/epel/epel-release-latest-${::operatingsystemmajrelease}.noarch.rpm"
      $php_repo_path = "https://mirror.webtatic.com/yum/el${::operatingsystemmajrelease}/latest.rpm"
    }
  }

  package { 'epel-release':
    ensure   => 'installed',
    source   => $epel_path,
    provider => 'rpm';
	    'webtatic-release':
    ensure   => 'installed',
    source   => $php_repo_path,
    provider => 'rpm';
  }

  Package { ensure => 'installed'}
  $php56 = [ 'php56w', 'php56w-cli', 'php56w-common', 'php56w-fpm', 'php56w-gd', 'php56w-intl',
             'php56w-mbstring', 'php56w-mysqlnd', 'php56w-opcache', 'php56w-pdo', 'php56w-process', 'php56w-recode',
             'php56w-xml', 'php56w-xmlrpc',  'php56w-ldap', 'php56w-mcrypt'  ]
  package { $php56: }

  
  service { 'php-fpm':
    ensure  => 'running',
    enable  => true,
    require => Package['php56w-fpm'],
  }
}
