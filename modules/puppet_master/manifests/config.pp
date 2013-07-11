class puppet_master::config {

  file { '/etc/puppet':
    owner  => 'puppet',
    group  => 'puppet',
    ensure => 'directory',
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

  file { '/etc/sysconfig/puppetmaster':
    owner  => 'puppet',
    group  => 'puppet',
    mode   => '0444',
    source => 'puppet:///modules/puppet_master/etc/sysconfig/puppetmaster',
  }

}
