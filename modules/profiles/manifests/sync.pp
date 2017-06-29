class profiles::sync {

file {'/etc/puppetlabs/puppet/software/':
  ensure  => directory,
  recurse => true,
  purge   => true,
  source  => 'puppet:///software/',
  }

file {'/etc/puppetlabs/puppet/fileserver.conf':
  ensure  => directory,
  recurse => true,
  purge   => true,
  source  => 'puppet:///files/fileserver.conf',
  }

}
