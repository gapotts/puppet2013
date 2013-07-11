
class puppet_master {

  include puppet_master::user
  include puppet_master::config
  include puppet_master::repo
  include puppet_master::service

  Class['puppet_master::user'] ->
  Class['puppet_master::config'] ->
  Class['puppet_master::repo'] ->
  Class['puppet_master::service']

  Class['puppet_master::config'] ->
  Class['puppet_master::service']
}
