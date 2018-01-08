define sslh::protocol(
                        $host,
                        $port,
                        $protocol_name = $name,
                        $order         = '00',
                      ) {
  # protocols:
  # (
  #      { name: "ssh"; service: "ssh"; host: "localhost"; port: "22"; fork: true; },
  #      { name: "openvpn"; host: "localhost"; port: "1194"; },
  #      { name: "xmpp"; host: "localhost"; port: "5222"; },
  #      { name: "http"; host: "localhost"; port: "80"; },
  #      { name: "ssl"; host: "localhost"; port: "443"; log_level: 0; },
  #      { name: "anyprot"; host: "localhost"; port: "443"; }
  # );

  concat::fragment{ "/etc/sslh.cfg protocols ${protocol_name}":
    target  => '/etc/sslh.cfg',
    order   => "03${order}",
    content => template("${module_name}/protocol.erb"),
  }

}
