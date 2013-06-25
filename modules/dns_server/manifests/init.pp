class dns_server ($type = 'master') {

  package { 'bind':
    ensure   => installed,
    provider => yum,
  }

  package { 'bind-chroot':
    ensure   => installed,
    provider => yum,
  }

  file { '/var/named':
    ensure  => directory,
    owner   => 'root',
    group   => 'named',
    mode    => '0755',
  }

  file { '/var/named/root.hint':
    mode    => '0444',
    owner   => 'root',
    group   => 'named',
    source  => 'puppet:///modules/dns_server/var/named/root.hint',
  }

  file { '/etc/named.conf':
    mode    => '0444',
    owner   => 'root',
    group   => 'named',
    source  => "puppet:///modules/dns_server/etc/named.conf.${type}",
    notify  => Service['named'],
  }

  case $type {
    'master': {
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

    'slave': {
      file { '/var/named/slave':
        ensure  => 'directory',
        owner   => 'root',
        group   => 'named',
        mode    => '0775';
      }
    }

    default: { fail "Unknown type ${type}!" }
  }

  service { 'named':
    ensure    => running,
    enable    => true,
    hasstatus => false,
    status    => '/usr/bin/pgrep named >/dev/null',
    provider  => 'redhat',
  }

}
