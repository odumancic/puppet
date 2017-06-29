class profiles::sync {

file {'//etc/puppetlabs/puppet/software/':
  ensure  => directory,
  recurse => true,
  purge   => true,
  source  => 'puppet:///software/',
  }
}
