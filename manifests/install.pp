class maxscale::install inherits maxscale {

  include apt
  
  apt::source { 'maxscale':
    location => $maxscale::apt_url,
    release  => '/',
    repos    => '',
    key      => {
      id     => 'BCECA90325B072AB1245F739AB7C32C35180350A',
      source => 'https://download.owncloud.org/download/repositories/stable/Debian_8.0/Release.key',
    },
  }
  
  
  package { 'maxscale':
    ensure  => present,
    require => Apt::Source['maxscale'],
  }
}