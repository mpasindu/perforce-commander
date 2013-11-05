class perforce-commander::sync(
  $key,
  $p4user,
)
{
  exec{"p4-sync":
    command => "p4 -u ${p4user} -P ${key} sync -f",
    path => ["/usr/local/bin/","/usr/bin","/bin"],
    logoutput   => true,
    timeout     => 1800,
  }
}
