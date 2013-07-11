class puppet_master::service {
  file { '/etc/init.d/puppetmaster':
    owner  => 'puppet',
    group  => 'puppet',
    mode   => '0544',
    source => 'puppet:///modules/puppet_master/etc/init.d/puppetmaster',
  }

  service { 'puppetmaster':
    ensure  => 'running',
    enable  => true,
  }

  File['/etc/init.d/puppetmaster'] -> Service['puppetmaster']
}
