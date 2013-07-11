#
# = puppet_master::user::user
#
# Sets up the puppet user and group.
#
class puppet_master::user::user {

  group { 'puppet':
    gid   => '52',
  }

  user { 'puppet':
    uid    => '52',
    gid    => '52',
    groups => 'wheel',
    shell  => '/bin/bash',
    home   => '/var/lib/puppet',
  }
}
