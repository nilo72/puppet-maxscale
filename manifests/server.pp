define maxscale::server (
  $name       = undef,
  $type       = undef,
  $port       = undef,
  $protocol   = undef,
  $address    = undef,
  $serv_weight = undef,

){

  if ! defined(Class['maxscale']){
    fail('You must include the maxcale base class before using any maxscale defined resoures')
  }

  ini_setting { 'maxscale server1 address' :
    ensure         => present,
    path           => $maxscale::configfile,
    section        => 'server1',
    setting        => 'address',
    value          => $address,
    section_prefix => '[',
    section_suffix => ']',
  }

  ini_setting { 'maxscale server1 type' :
    ensure         => present,
    path           => $maxscale::configfile,
    section        => 'server1',
    setting        => 'type',
    value          => $type,
    section_prefix => '[',
    section_suffix => ']',
  }

  ini_setting { 'maxscale server1 port' :
    ensure         => present,
    path           => $maxscale::configfile,
    section        => 'server1',
    setting        => 'port',
    value          => $port,
    section_prefix => '[',
    section_suffix => ']',
  }

  ini_setting { 'maxscale server1 serv_weight' :
    ensure         => present,
    path           => $maxscale::configfile,
    section        => 'server1',
    setting        => 'serv_weight',
    value          => $serv_weight,
    section_prefix => '[',
    section_suffix => ']',
  }

  ini_setting { 'maxscale server1 protocol' :
    ensure         => present,
    path           => $maxscale::configfile,
    section        => 'server1',
    setting        => 'protocol',
    value          => $protocol,
    section_prefix => '[',
    section_suffix => ']',
  }

}