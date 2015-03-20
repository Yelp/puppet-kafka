class kafka::server::service {

  case $kafka::server::enable {
    true: {
      $ensure = 'running'
      $enable = true
    }
    default: {
      $ensure = 'stopped'
      $enable = false
    }
  }

  service { 'kafka':
    ensure  => $ensure,
    enable  => $enable,
    require => [
      Class['kafka::install'],
      Class['kafka::server::config'],
    ],
  }

}
