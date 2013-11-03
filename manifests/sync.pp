class perforce-commander::sync($key){

  exec{"p4-sync":
    command => "p4 -u ${user} -P ${key} sync -f",
    path => ["/usr/local/bin/","/usr/bin","/bin"],
    logoutput   => true,
    timeout     => 1800,
  }


}
