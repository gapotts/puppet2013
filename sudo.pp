class sudo {
  package { 'sudo':
    ensure => 'installed',
  }
  
  file { '/etc/sudoers':
    owner   => 'root',
    group   => 'root',
    mode    => '0440',
    content => "%wheel\tALL = (ALL) NOPASSWD: ALL\n",
    require => Package['sudo'],
  }
}

include sudo
