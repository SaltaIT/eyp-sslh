class sslh::config inherits sslh {

  systemd::service::dropin { 'sslh':
    pid_file                => '/run/sslh.pid',
    capability_bounding_set => [ 'CAP_SETGID','CAP_SETUID', 'CAP_NET_BIND_SERVICE', 'CAP_NET_ADMIN', 'CAP_SYS_CHROOT' ],
  }

  concat { '/etc/sslh.cfg':
    ensure => 'present',
    owner  => 'root',
    group  => 'root',
    mode   => '0640',
  }

  concat::fragment{ '/etc/sslh.cfg base':
    target  => '/etc/sslh.cfg',
    order   => '0000',
    content => template("${module_name}/sslh-base.erb"),
  }

  # listen
  concat::fragment{ '/etc/sslh.cfg listen base':
    target  => '/etc/sslh.cfg',
    order   => '0100',
    content => template("${module_name}/sslh-listen.erb"),
  }

  concat::fragment{ '/etc/sslh.cfg listen end':
    target  => '/etc/sslh.cfg',
    order   => '0199',
    content => ");\n",
  }

  #protocols
  concat::fragment{ '/etc/sslh.cfg protocols base':
    target  => '/etc/sslh.cfg',
    order   => '0200',
    content => "\nprotocols:\n(\n",
  }

  ## 03 per sslh::protocol

  concat::fragment{ '/etc/sslh.cfg protocols end':
    target  => '/etc/sslh.cfg',
    order   => '0499',
    content => template("${module_name}/sslh-protocols.erb"),
  }

}
