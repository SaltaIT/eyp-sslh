class sslh::install inherits sslh {

  Exec {
    path => '/usr/sbin:/usr/bin:/sbin:/bin'
  }

  if($sslh::manage_package)
  {
    exec { 'eyp-sslh which git':
      command => 'which git',
      unless  => 'which git',
    }

    gitclone { 'https://github.com/yrutschle/sslh':
      creates => "${sslh::srcdir}/sslh",
      require => Exec['eyp-sslh which git'],
    }

    #install_dependencies
    package { $sslh::params::install_dependencies:
      ensure => $sslh::package_ensure,
    }

    # systemd socket activation
    # #cat Makefile | sed 's/^USESYSTEMD=.*/USESYSTEMD=1    # Make use of systemd socket activation/
    # if($sslh::params::use_systemd)
    # {
    #   $systemd_makefile_opt='USESYSTEMD=1    # Make use of systemd socket activation'
    # }
    # else
    # {
    #   $systemd_makefile_opt='USESYSTEMD=0    # Make use of systemd socket activation'
    # }
    #
    # exec { 'set systemd makefile sslh':
    #   command => "sed 's/^USESYSTEMD=.*/${systemd_makefile_opt}/' -i ${sslh::srcdir}/sslh/Makefile",
    #   unless  => "grep '${systemd_makefile_opt}' ${sslh::srcdir}/sslh/Makefile",
    #   require => Gitclone['https://github.com/yrutschle/sslh'],
    # }

    exec { 'sslh make install':
      command => 'make install',
      creates => '/usr/sbin/sslh',
      cwd     => "${sslh::srcdir}/sslh",
      require => [ Gitclone['https://github.com/yrutschle/sslh'], Package[$sslh::params::install_dependencies] ],
    }

  }

}
