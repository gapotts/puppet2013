class dns_server::master inherits dns_server {

  file { '/etc/named.conf':
    mode    => '0444',
    owner   => 'root',
    group   => 'named',
    source  => 'puppet:///modules/dns_server/etc/named.conf.master',
    notify  => Service['named'],
  }

  file { '/var/named/master':
    mode    => '0644',
    owner   => 'root',
    group   => 'named',
    purge   => 'true',
    recurse => 'true',
    source  => 'puppet:///modules/dns_server/var/named/master',
    notify  => Service['named'],
  }
}
