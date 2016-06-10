class maxscale::install inherits maxscale {

  include apt
  
  apt::source { 'maxscale':
    location => $maxscale::apt_url,
    release  => 'jessie',
    repos    => 'main',
    key      => {
      id     => '199369E5404BD5FC7D2FE43BCBCB082A1BB943DB',
      source => 'http://downloads.mariadb.com/enterprise/xagz-pk9v/mariadb-maxscale/latest/debian/dists/jessie/Release.gpg',
    },
  }
  
  
  package { 'maxscale':
    ensure  => present,
    require => Apt::Source['maxscale'],
  }
}