class puppet_master::user {
  include puppet_master::user::user
  include puppet_master::user::files

  Class['puppet_master::user::user'] -> Class['puppet_master::user::files']
}
