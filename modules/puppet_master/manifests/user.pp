#
# = puppet_master::user
#
# Sets up the puppet user and group. Configures ssh keys for puppet.
#
# = Usage
#
# include puppet_master::user 
#
class puppet_master::user {

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

  file { '/var/lib/puppet':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  file { '/var/lib/puppet/.ssh':
    ensure => 'directory',
    owner  => 'root',
    group  => 'puppet',
    mode   => '0750',
  }

  file { '/var/lib/puppet/.ssh/id_rsa':
    owner  => 'puppet',
    group  => 'puppet',
    mode   => '0400',
    source => 'puppet:///modules/puppet_master/var/lib/puppet/.ssh/puppet.priv',
  }

  file { '/var/lib/puppet/.ssh/authorized_keys':
    owner  => 'puppet',
    group  => 'puppet',
    mode   => '0440',
    source => 'puppet:///modules/puppet_master/var/lib/puppet/.ssh/puppet.pub',
  }

  file { '/var/lib/puppet/.ssh/config':
    owner  => 'puppet',
    group  => 'puppet',
    mode   => '0400',
    source => 'puppet:///modules/puppet_master/var/lib/puppet/.ssh/config',
  }

  file { '/var/lib/puppet/.ssh/known_hosts':
    ensure => 'present',
    owner  => 'puppet',
    group  => 'puppet',
    mode   => '0600',
  }
}
