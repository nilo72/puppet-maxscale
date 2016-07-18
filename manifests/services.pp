define maxscale::services (
  $name        = undef,
  $type        = undef,
  $router      = undef,
  $servers     = undef,
  $sectionname = undef,
){
  validate_string($servers)
  validate_string($name)
  validate_string($type)
  validate_string($router)

  if ! defined(Class['maxscale']){
    fail('You must include the maxcale base class before using any maxscale defined resoures')
  }

  ini_setting { 'service_router':
    ensure         => present,
    path           => $maxscale::configfile,
    section        => $sectionname,
    setting        => 'router',
    value          => $router,
    section_prefix => '[',
    section_suffix => ']',
  }

  ini_setting { 'service_type':
    ensure         => present,
    path           => $maxscale::configfile,
    section        => $sectionname,
    setting        => 'type',
    value          => $type,
    section_prefix => '[',
    section_suffix => ']',
  }

  ini_setting { 'service_servers':
    ensure         => present,
    path           => $maxscale::configfile,
    section        => $sectionname,
    setting        => 'servers',
    value          => $servers,
    section_prefix => '[',
    section_suffix => ']',
  }
}