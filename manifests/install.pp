class kafka::install {
  if $kafka::version == '0.9.0.2' {
    package { 'confluent-kafka':
      ensure => 'absent',
    } ->
    package { 'kafka':
      ensure => $kafka::version,
    }
  } else{
    package { 'kafka':
      ensure => 'absent',
    } ->
    package { 'confluent-kafka':
      ensure => $kafka::version,
    }
  }
}
