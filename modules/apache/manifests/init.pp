class apache {
  include apache::package
  include apache::service

  Class['apache::package'] ->
  Class['apache::service']
} 
