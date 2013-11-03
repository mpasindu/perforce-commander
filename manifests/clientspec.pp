class perforce-commander::clientspec(

  $client   = $::hostname,
  $owner    = 'owner',
  $host     = $::hostname,
  $root     = '/',
  $view     = [],
)

{

  file{'/data/puppet/template':

    ensure => present,
    content =>  template('perforce-commander/client-spec.erb'),

  }

#  exec{'create-cliert-spec':
#    command => 'cat /data/puppet/template  | p4 client -i'
  
#  }

}
