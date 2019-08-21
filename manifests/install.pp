class sslh::install inherits sslh {

    if($sslh::params::include_epel)
    {
      include ::epel

      Package[$sslh::params::package_name] {
        require => Class['::epel'],
      }
    }

    if($sslh::manage_package)
    {
      package { $sslh::params::package_name:
        ensure => $sslh::package_ensure,
      }
    }

}
