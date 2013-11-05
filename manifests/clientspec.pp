class perforce-commander::clientspec(

  $client           = $::hostname,
  $owner            = 'owner',
  $host             = $::hostname,
  $root             = '/',
  $view             = [],
  $p4port           = '1697',
  $p4host           = '10.180.202.221',
  $p4connection     = "$p4host:$p4port",
  $key              = '',
  $templatelocation = '/data/puppet/template',
)

{

  file{$templatelocation:
    ensure => present,
    content =>  template('perforce-commander/client-spec.erb'),

  }

  exec {'p4-client':
    environment => ["P4PORT=10.180.202.221:1697","P4CLIENT=${client}","P4USER=${owner}"],
    command     => "cat $templatelocation | p4 -u ${owner} -P ${key} client -i",
    path        => ['/bin','/usr/local/bin'],

  }

}
