class mysql_install {

  case $::operatingsystemmajrelease {
    '7': {
      $mysql_path = "http://dev.mysql.com/get/mysql57-community-release-el${::operatingsystemmajrelease}-7.noarch.rpm"
    }
    '6': {
      $mysql_path = "http://dev.mysql.com/get/mysql57-community-release-el${::operatingsystemmajrelease}-7.noarch.rpm"
    }
  }

  package { 'mysql':
    ensure   => 'installed',
    source   => $mysql_path,
    provider => 'rpm';
  }

  file {'/etc/init.d/mysqld':
    ensure => file,
    source => 'puppet:///software/mysqld',
    require => Package['mysql-community-server'],
  }  

  package { 'mysql-community-server':
    ensure   => installed,
  }

  service { 'mysqld':
    ensure  => 'running',
    enable  => true,
    require => Package['mysql-community-server'],
  }

}
