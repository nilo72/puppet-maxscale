class maxscale::config inherits maxscale{



  ini_setting { 'maxscale threads':
    ensure         => present,
    path           => $maxscale::configfile,
    section        => 'MaxScale',
    setting        => 'threads',
    value          => '1',
    section_prefix => '[',
    section_suffix => ']',
  }
}