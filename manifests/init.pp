# == Class: perforce-commander
#
# Full description of class perforce-commander here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { perforce-commander:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
#  }
#
# === Authors
#
# Author Name <Pasindu madubashna Gunarathne mpasindu@gmil.com>
#
# === Copyright
#
# Copyright 2013 Your name here, unless otherwise noted.
#

class perforce-commander(
  $p4user           = "rootdddd",
  $host             = "host",
  $port             = "8080",
  $passwd           = '',
  $p4location       = "/usr/bin/",
  $sync             = false,
  $p4file           = $::home,
  $client           = false,
  $p4connection     = "${host}:${post}",
  $cluent           = $::hostname,
  $root             = '/',
  $viwe             = [],
  $tampletelocation = '/data/puppet/template'
)
{

  exec{"p4-key-gen":
    environment => ["P4USER=${p4user}","P4PORT=10.180.202.221:1697"],
    command     => "echo ${passwd} | p4  login -p 1> ${pwfile}/.p4 && sed -i -e \"1 d\" ${pwfile}/.p4 ",
    path        => ["${p4location}",'/bin'],
  }

  if $sync ==  true {
    notify{'sync in':

    }
    class {perforce-commander::sync:
      require => Exec['p4-key-gen'],
      key     => $::p4pw,
      p4user    => $p4user,
    }
  }
  else {
    notify{'perforce sync have values false , if need sysnc set into true.':
    }
  }

  if $client == true{
    class{perforce-commander::clientspec:
      key              => $::p4pw,
      owner            => $p4user,
      templatelocation => $templatelocation,
    }
  }
  else {
    notify{'set client into true ':

    }
  }

}
