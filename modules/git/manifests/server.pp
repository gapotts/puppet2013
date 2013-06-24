
class git::server {
  include git

  file { '/srv/gitrepos':
    ensure => 'directory',
    mode   => '0755',
  }
}
