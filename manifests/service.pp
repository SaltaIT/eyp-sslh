class sslh::service inherits sslh {

  #
  validate_bool($sslh::manage_docker_service)
  validate_bool($sslh::manage_service)
  validate_bool($sslh::service_enable)

  validate_re($sslh::service_ensure, [ '^running$', '^stopped$' ], "Not a valid daemon status: ${sslh::service_ensure}")

  $is_docker_container_var=getvar('::eyp_docker_iscontainer')
  $is_docker_container=str2bool($is_docker_container_var)

  if( $is_docker_container==false or
      $sslh::manage_docker_service)
  {
    if($sslh::manage_service)
    {
      service { $sslh::params::service_name:
        ensure => $sslh::service_ensure,
        enable => $sslh::service_enable,
      }
    }
  }
}
