class maxscale::install inherits maxscale {

  include apt

  apt::source { 'maxscale':
    location => $maxscale::apt_url,
    release  => $release,
    repos    => $repository,
    key      => {
      id     => $fingerprint,
      server => $keyserver,
    },
  }

  package { 'maxscale':
    ensure  => present,
    require => Apt::Source['maxscale'],
  }
}