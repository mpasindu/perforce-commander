class perforce-commander::sync(
  $key,
  $p4user,
  $client,
)
{
  exec{"p4-sync":
    environment => ["P4CLIENT=${client}","P4USER=${p4user}","P4PORT=10.180.202.221:1697"],
    command     => "p4 -P ${key}  sync -f",
    path        => ["/usr/local/bin/","/usr/bin","/bin"],
    logoutput   => true,
    timeout     => 1800,
  }
}
