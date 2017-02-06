class kafka::install {
  if $kafka::version == '0.9.0.2' {
    package { 'kafka':
      ensure => $kafka::version,
    }
    package { 'confluent-kafka':
      ensure => 'absent',
    }
  } else{
    package { 'confluent-kafka':
      ensure => $kafka::version,
    }
    package { 'kafka':
      ensure => 'absent',
    }
  }
}
