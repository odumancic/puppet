class profiles::test_repo {

file {'/opt/packer_1.0.2_linux_amd64.zip':
  ensure  => directory,
  recurse => true,
  purge   => true,
  source  => 'puppet:///software/packer_1.0.2_linux_amd64.zip',
  }
}
