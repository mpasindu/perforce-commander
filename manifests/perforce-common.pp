class perforce-commander::perforce-common{

 exec{"echo rootadmin123$ | p4 login":
  path => ["/bin","/usr/bin"],
 }

 exec{"p4 sync":
  path => ["/bin","/usr/bin"],
 }

}
