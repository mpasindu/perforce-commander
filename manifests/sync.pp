class perforce-commander::sync(
  $key,
  $p4user,
  $client,
  $p4port,
)
{

notify{$p4port:

}
  exec{"p4-sync":
    environment => ["P4CLIENT=${client}","P4USER=${p4user}","P4PORT=$p4port"],
    command     => "p4 -P ${key}  sync -f",
    path        => ["/usr/local/bin/","/usr/bin","/bin"],
    logoutput   => true,
    timeout     => 1800,
  }
}
