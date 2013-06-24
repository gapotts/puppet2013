class dns_client {
  package { 'bind-utils':
    ensure => 'installed',
  }

  file { '/etc/resolv.conf':
    owner  => 'root',
    group  => 'root',
    mode   => '0444',
    source => 'puppet:///modules/dns_client/etc/resolv.conf',
  }

  file { '/etc/hosts':
    owner  => 'root',
    group  => 'root',
    mode   => '0444',
    source => 'puppet:///modules/dns_client/etc/hosts',
  }
}
