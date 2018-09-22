class kafka::server::config {

  if $::lsbdistcodename == 'trusty' {
    file { '/etc/init/kafka.conf':
      ensure => 'file',
      owner  => 'root',
      group  => 'root',
      mode   => '0444',
      content => template('kafka/kafka.conf.erb'),
    }
  } else {
    systemd::unit_file { 'kafka.service':
      content   => template('kafka/kafka.service.erb'),
    }
    file { $upstart_file:
      ensure => 'absent',
    }
  }

  file { '/etc/default/kafka':
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0444',
    content => template('kafka/kafka.default.erb'),
  }

  file { '/etc/kafka/server.properties':
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0444',
    content => template('kafka/server.properties.erb'),
  }

  file { '/etc/profile.d/kafka_env.sh':
    ensure  => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0444',
    content => template('kafka/kafka_env.sh.erb'),
  }

  file { $kafka::server::log_dirs:
    ensure  => 'directory',
    owner   => 'kafka',
    group   => 'kafka',
    mode    => '0755',
  }

  file { $kafka::server::kafka_log_directory:
    ensure  => 'directory',
    owner   => 'kafka',
    group   => 'kafka',
    mode    => '0755',
  }

}
