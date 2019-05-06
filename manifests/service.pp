class sslh::service inherits sslh {

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
