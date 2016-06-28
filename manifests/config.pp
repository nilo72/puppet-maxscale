class maxscale::config inherits maxscale{

  ini_setting { 'maxscale router':
    ensure         => present,
    path           => $maxscale::configfile,
    section        => 'OwncloudService',
    setting        => 'router',
    value          => 'readconnroute',
    section_prefix => '[',
    section_suffix => ']',
  }

  ini_setting { 'maxscale service type':
    ensure         => present,
    path           => $maxscale::configfile,
    section        => 'OwncloudService',
    setting        => 'type',
    value          => 'service',
    section_prefix => '[',
    section_suffix => ']',
  }

  ini_setting { 'maxscale servers':
    ensure         => present,
    path           => $maxscale::configfile,
    section        => 'OwncloudService',
    setting        => 'servers',
    value          => 'server1,server2,server3',
    section_prefix => '[',
    section_suffix => ']',
  }

  ini_setting { 'maxscale threads':
    ensure         => present,
    path           => $maxscale::configfile,
    section        => 'MaxScale',
    setting        => 'threads',
    value          => '1',
    section_prefix => '[',
    section_suffix => ']',
  }

  ini_setting { 'maxscale server1 address' :
    ensure         => present,
    path           => $maxscale::configfile,
    section        => 'server1',
    setting        => 'address',
    value          => $maxscale::server1_address,
    section_prefix => '[',
    section_suffix => ']',
  }

  ini_setting { 'maxscale server1 type' :
    ensure         => present,
    path           => $maxscale::configfile,
    section        => 'server1',
    setting        => 'type',
    value          => 'server',
    section_prefix => '[',
    section_suffix => ']',
  }

  ini_setting { 'maxscale server1 port' :
    ensure         => present,
    path           => $maxscale::configfile,
    section        => 'server1',
    setting        => 'port',
    value          => '3306',
    section_prefix => '[',
    section_suffix => ']',
  }

  ini_setting { 'maxscale server1 serv_weight' :
    ensure         => present,
    path           => $maxscale::configfile,
    section        => 'server1',
    setting        => 'serv_weight',
    value          => '3',
    section_prefix => '[',
    section_suffix => ']',
  }

  ini_setting { 'maxscale server1 protocol' :
    ensure         => present,
    path           => $maxscale::configfile,
    section        => 'server1',
    setting        => 'protocol',
    value          => 'MySQLBackend',
    section_prefix => '[',
    section_suffix => ']',
  }

}