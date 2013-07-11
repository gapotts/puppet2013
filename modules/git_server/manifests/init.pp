class git_server {
  package { 'git':
    ensure => 'installed',
  }

  file { '/srv/gitrepos':
    ensure => 'directory',
    mode   => '0755',
  }
}
