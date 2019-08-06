class { 'sslh':
  listen_port => '443',
}

sslh::protocol { 'openvpn':
  host => '127.0.0.1',
  port => '1194',
}

sslh::protocol { 'anyprot':
  host => '127.0.0.1',
  port => '9443',
}
