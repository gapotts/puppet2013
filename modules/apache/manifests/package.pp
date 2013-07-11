class apache::package {
  package { 'httpd':
    ensure => 'present',
  }

  package { 'mod_ssl':
    ensure => 'present',
  }

  package { 'mod_passenger':
    ensure => 'present',
  }

  Package['httpd'] ->
  Package['mod_ssl'] ->
  Package['mod_passenger']
}
