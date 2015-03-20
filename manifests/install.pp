class kafka::install {

  package { 'confluent-kafka':
    ensure => $kafka::version,
  }

}
