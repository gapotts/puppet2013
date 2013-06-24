
class git::puppetrepo {
  include git::server

  file { '/srv/gitrepos/puppet':
    ensure => 'directory',
    group  => 'wheel',
    mode   => '2770',
  }

  exec { 'create_puppet_repo':
    command => '/usr/bin/git init --bare --shared=group /srv/gitrepos/puppet',
    creates => '/srv/gitrepos/puppet/HEAD',
    require => [ Package['git'], File['/srv/gitrepos/puppet'] ],
  }
}

