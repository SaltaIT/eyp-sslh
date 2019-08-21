class sslh::params {

  $package_name='sslh'
  $service_name='sslh'

  case $::osfamily
  {
    'redhat':
    {
      case $::operatingsystemrelease
      {
        /^7.*$/:
        {
          $include_epel=true
        }
        default: { fail("Unsupported RHEL/CentOS version! - ${::operatingsystemrelease}")  }
      }
    }
    default: { fail('Unsupported OS!')  }
  }
}
