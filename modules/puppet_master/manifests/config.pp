class puppet_master::config {

  file { '/etc/puppet':
    ensure => 'directory',
    owner  => 'puppet',
    group  => 'puppet',
  }

  file { '/etc/puppet/puppet.conf':
    owner  => 'puppet',
    group  => 'puppet',
    mode   => '0444',
    source => 'puppet:///modules/puppet_master/etc/puppet/puppet.conf',
  }

  file { '/etc/puppet/autosign.conf':
    owner  => 'puppet',
    group  => 'puppet',
    mode   => '0444',
    source => 'puppet:///modules/puppet_master/etc/puppet/autosign.conf',
  }

  file { '/etc/puppet/rack':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  file { '/etc/puppet/rack/public':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  file { '/etc/puppet/rack/config.ru':
    owner  => 'puppet',
    group  => 'root',
    mode   => '0755',
    source => 'puppet:///modules/puppet_master/etc/puppet/rack/config.ru'
  }

  file { '/etc/sysconfig/puppetmaster':
    owner  => 'puppet',
    group  => 'puppet',
    mode   => '0444',
    source => 'puppet:///modules/puppet_master/etc/sysconfig/puppetmaster',
  }

}
