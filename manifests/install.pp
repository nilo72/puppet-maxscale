class maxscale::install inherits maxscale {

  include apt
  
  apt::source { 'maxscale':
    location => $maxscale::apt_url,
    release  => 'jessie',
    repos    => 'main',
    key      => {
      id     => '﻿13CFDE6DD9EE9784F41AF0F670E4618A8167EE24',
      source => 'http://downloads.mariadb.com/enterprise/xagz-pk9v/mariadb-maxscale/latest/debian/dists/jessie/Release.gpg',
    },
  }
  
  
  package { 'maxscale':
    ensure  => present,
    require => Apt::Source['maxscale'],
  }
}