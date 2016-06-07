class maxscale (
  $fqdn = $::fqdn,
  $hostname = $maxscale::params::hostname,
  $service_ensure = $maxscale::service_ensure,
  $service_enable = $maxscale::service_enable,
  $service_name = $maxscale::service_name,
  $apt_url = $maxscale::apt_url,
) inherits maxscale::params{
    
  validate_string($fqdn)
  validate_string($hostname)
  validate_bool($service_enable)
  validate_string($service_ensure)
  validate_string($service_name)
  

  anchor { 'maxscale::begin': } ->
  class { '::maxscale::install': } ->
  class { '::maxscale::config': } ~>
  class { '::maxscale::service': } ->
  anchor { 'maxscale::end': }
}