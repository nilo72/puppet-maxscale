class maxscale (
  $fqdn = $::fqdn,
  $hostname = $maxscale::params::hostname,
  $service_ensure = $maxscale::params::service_ensure,
  $service_enable = $maxscale::params::service_enable,
  $service_name = $maxscale::params::service_name,
  $service_dbs = $maxscale::params::service_dbs,
  $apt_url = $maxscale::params::apt_url,
  $configfile = $maxscale::params::configfile,
) inherits maxscale::params{
    
  validate_string($fqdn)
  validate_string($hostname)
  validate_bool($service_enable)
  validate_string($service_ensure)
  validate_string($service_name)
  validate_array($service_dbs)
  

  anchor { 'maxscale::begin': } ->
  class { '::maxscale::install': } ->
  class { '::maxscale::config': } ~>
  class { '::maxscale::service': } ->
  anchor { 'maxscale::end': }
}