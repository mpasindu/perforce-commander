class perforce-commander::perforce{

  wget::fetch { 'p4':
    source      => 'http://www.perforce.com/downloads/perforce/r12.1/bin.linux26x86_64/p4',
    destination => '/usr/bin/p4',
    verbose => true
    } 
    file { '/usr/bin/p4':
      mode => '0755',
    }

    file{"/etc/profile.d/p4-bash.sh":
      ensure => present,
      source => "puppet:///modules/perforce-commander/p4-bash.sh"

    }


    exec{'p4-login':
      command => "echo \"rootadmin123$\" | p4 login",
      path => "/usr/bin"
    }

    exec{'p4-sync':
      command => 'sudo -E p4 sync', 
      path => "/usr/bin"

    }

    exec{'tar -xvzf /opt/dvgbnode/GradeBookPackage.tar.gz -C /opt/dvgbnode/':
      path => "/usr/bin"

    }

}
