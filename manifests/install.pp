class kafka::install {
  package { 'kafka':
    ensure => 'absent',
  } ->
  package { 'confluent-kafka':
    ensure => $kafka::version,
  }
}
