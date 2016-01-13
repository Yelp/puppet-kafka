class kafka::server(

  $enable                              = $kafka::server::params::enable,

  # Essential Kafka configuration
  $broker_id                           = $kafka::server::params::broker_id,
  $log_dirs                            = $kafka::server::params::log_dirs,
  $zookeeper_connect                   = $kafka::server::params::zookeeper_connect,

  # Other Kafka configuration
  $server_properties                   = $kafka::server::params::server_properties,

  # Operational configuration
  $java_home                           = $kafka::server::params::java_home,
  $heap_opts                           = $kafka::server::params::heap_opts,
  $kill_timeout_seconds                = $kafka::server::params::kill_timeout_seconds,
  $gc_log_enabled                      = $kafka::server::params::gc_log_enabled,
  $jmx_port                            = $kafka::server::params::jmx_port,
  $classpath                           = $kafka::server::params::classpath,
  $kafka_log_directory                 = $kafka::server::params::kafka_log_directory,
  $kafka_log4j_config                  = $kafka::server::params::kafka_log4j_config,
  $jvm_performance_opts                = $kafka::server::params::jvm_performance_opts,

) inherits kafka::server::params {

  validate_bool($enable)

  if !is_integer($broker_id) or $broker_id < 0 or $broker_id > 2147483647 {
    fail('broker_id must be an integer between 0 and 2147483647')
  }

  validate_array($log_dirs)
  if empty($log_dirs) {
    fail('log_dirs must not be empty')
  }

  validate_string($zookeeper_connect)
  if empty($zookeeper_connect) {
    fail('zookeeper_connect must not be empty')
  }

  validate_hash($server_properties)

  if $java_home {
    validate_string($java_home)
  }

  if $heap_opts {
    validate_string($heap_opts)
  }

  if $gc_log_enabled {
    validate_bool($gc_log_enabled)
  }

  if $jmx_port and !is_integer($jmx_port) {
    fail('jmx_port must be a port number between 1 and 65535')
  }

  if $classpath {
    validate_string($classpath)
  }

  validate_absolute_path($kafka_log_directory)

  include kafka::user

  contain kafka::server::config
  contain kafka::server::service

  Class['kafka::install'] -> Class['kafka::server::config']

}
