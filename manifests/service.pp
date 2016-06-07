
# owncloud service
class maxscale::service inherits maxscale{

  #owncloud service is driven via apace

  if !($maxscale::service_ensure in ['running','stopped']){
    fail('service_ensure parameter must be running or stopped')
  }

  if $maxscale::service_manage == true {
    service { 'maxscale':
      ensure    => $maxscale::service_ensure,
      enable    => $maxscale::service_enable,
      name      => $maxscale::service_name,
      hasstatus => true,
      hasstart  => true,
    }
  }
}