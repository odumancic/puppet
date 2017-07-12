class profiles::test {

  @@file { "/tmp/dbdone.txt": content => "Woo, DB installed!\n", tag => "dbdone", } 
}
