class kafka::server::params {

  $enable                              = true

  # Essential Kafka configuration
  $broker_id                           = false
  $log_dirs                            = ['/var/spool/kafka']
  $zookeeper_connect                   = false
  $broker_rack			       = false
  $is_broker_rack_aware                = false

  # Other Kafka configuration
  $server_properties                   = {}

  # Operational configuration
  $java_home                           = false
  $heap_opts                           = false
  $kill_timeout_seconds                = 60
  $gc_log_enabled                      = false
  $jmx_port                            = 9999
  $classpath                           = false
  $kafka_log_directory                 = '/var/log/kafka'
  $kafka_log4j_config                  = '/etc/kafka/log4j.properties'
  $jvm_performance_opts                = false

}
