class kafka::install {
  if $kafka::version in ['0.10.2.2-yelp1'] {
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
