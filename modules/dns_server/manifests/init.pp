class dns_server {

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

  service { 'named':
    ensure    => running,
    enable    => true,
    hasstatus => false,
    status    => '/usr/bin/pgrep named >/dev/null',
    provider  => 'redhat',
  }

}
