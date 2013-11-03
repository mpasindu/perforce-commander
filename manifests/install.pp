class perforce-commander::install(){

  wget::fetch { 'p4':
    source      => 'http://www.perforce.com/downloads/perforce/r12.1/bin.linux26x86_64/p4',
    destination => '/usr/bin',
    } 
    file { '/usr/bin/p4':
      mode => '0755',
    }


}
