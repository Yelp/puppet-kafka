class kafka(
  $version = $kafka::params::version,
) inherits kafka::params {

  validate_string($version)

  if versioncmp($version, '0.8.2') < 0 {
    fail('This module only supports Kafka >= 0.8.2')
  }

  contain kafka::install

}
