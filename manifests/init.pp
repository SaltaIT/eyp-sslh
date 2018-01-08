class sslh(
            $manage_package        = true,
            $package_ensure        = 'installed',
            $manage_service        = true,
            $manage_docker_service = true,
            $service_ensure        = 'running',
            $service_enable        = true,
            $srcdir                = '/usr/local/src',
            $pidfile               = '/var/run/sslh.pid',
            $listen                = $::ipaddress,
            $listen_port           = '443',
            $chroot                = '/var/empty',
            $default_host          = '127.0.0.1',
            $default_port          = '443',
          ) inherits sslh::params{

  class { '::sslh::install': }
  -> class { '::sslh::config': }
  ~> class { '::sslh::service': }
  -> Class['::sslh']

}
