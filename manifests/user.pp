class kafka::user {

  group { 'kafka':
    ensure => present,
    system => true,
  }

  user { 'kafka':
    ensure  => present,
    gid     => 'kafka',
    comment => 'Apache Kafka',
    shell   => '/bin/false',
    system  => true,
  }

}
