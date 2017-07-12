class profiles::test1 {
  File <<| tag == dbdone |>>

  notify {"Test":}

#  Pakackage{'jboss':
#  require => [ File<<| tag == dbdone |>>], }

}
