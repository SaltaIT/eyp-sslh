class sslh::params {

  $package_name='sslh'
  $service_name='sslh'

  $git_clone_url = 'https://github.com/yrutschle/sslh'

  # For Debian, these are contained in packages libwrap0-dev and libconfig8-dev.
  # For Fedora, you'll need packages libconfig and libconfig-devel:

  case $::osfamily
  {
    'redhat':
    {
      $install_dependencies = [ 'libconfig', 'libconfig-devel' ]
      case $::operatingsystemrelease
      {
        /^[5-6].*$/:
        {
          $use_systemd=false
          $sysv_basescript = 'scripts/etc.rc.d.init.d.sslh.centos'
        }
        /^7.*$/:
        {
          $use_systemd=true
          $sysv_basescript = undef
        }
        default: { fail("Unsupported RHEL/CentOS version! - ${::operatingsystemrelease}")  }
      }
    }
    'Debian':
    {
      $install_dependencies = [ 'libwrap0-dev', 'libconfig8-dev' ]
      case $::operatingsystem
      {
        'Ubuntu':
        {
          case $::operatingsystemrelease
          {
            /^14.*$/:
            {
              $use_systemd=false
              $sysv_basescript = 'scripts/etc.init.d.sslh'
            }
            /^16.*$/:
            {
              $use_systemd=true
              $sysv_basescript = undef
            }
            default: { fail("Unsupported Ubuntu version! - ${::operatingsystemrelease}")  }
          }
        }
        'Debian': { fail('Unsupported')  }
        default: { fail('Unsupported Debian flavour!')  }
      }
    }
    default: { fail('Unsupported OS!')  }
  }
}
