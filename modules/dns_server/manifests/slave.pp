class dns_server::slave inherits dns_server {

  file { '/etc/named.conf':
    mode    => '0444',
    owner   => 'root',
    group   => 'named',
    source  => 'puppet:///modules/dns/etc/named.conf.slave',
    notify  => Service['named'],
  }

  file { '/var/named/slave':
    ensure  => 'directory',
    owner   => 'root',
    group   => 'named',
    mode    => '0775',
  }
}
