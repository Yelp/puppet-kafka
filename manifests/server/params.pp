class kafka::server::params {

  $enable                              = true

  # Essential Kafka configuration
  $broker_id                           = undef
  $log_dirs                            = ['/var/spool/kafka']
  $zookeeper_connect                   = undef

  # Other Kafka configuration
  $server_properties                   = {}

  # Operational configuration
  $java_home                           = undef
  $heap_opts                           = undef
  $gc_log_enabled                      = undef
  $jmx_port                            = 9999
  $classpath                           = undef
  $kafka_log_directory                 = '/var/log/kafka'
  $kafka_log4j_config                  = '/etc/kafka/log4j.properties'

}
