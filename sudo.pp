package { 'sudo':
  ensure   => 'installed',
  provider => 'yum',
}

file { '/etc/sudoers':
  ensure  => 'present',
  owner   => 'root',
  group   => 'root',
  mode    => '0440',
  content => "%wheel\tALL = (ALL) NOPASSWD: ALL\n",
  require => Package['sudo'],
}
