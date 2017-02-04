class kafka::install {
  if $kafka::version == '0.9.0.2' {
    package { 'kafka':
      ensure => $kafka::version,
    }
  } else{
    package { 'confluent-kafka':
      ensure => $kafka::version,
    }
  }
}
