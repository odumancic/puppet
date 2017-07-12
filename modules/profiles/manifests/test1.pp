class profiles::test1 {
  File <<| tag == dbdone |>>

  notify {"Test":}
  notify {File<<| tag == dbdone |>>:}

#  Pakackage{'jboss':
#  require => [ File<<| tag == dbdone |>>], }

}
