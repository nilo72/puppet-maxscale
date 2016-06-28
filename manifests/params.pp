class maxscale::params {
  $hostname = ''
  $service_ensure = 'running'
  $service_enable = true
  $service_name = 'maxscale'
  $service_dbs = ['server1','server2','server3']
  $apt_url = undef

  case $::osfamily {
    'Debian': {
      $release     = $::lsbdistcodename
      $repository  = 'main'
      $fingerprint = '13CFDE6DD9EE9784F41AF0F670E4618A8167EE24'
      $keyserver   = 'hkp://keyserver.ubuntu.com:80'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}