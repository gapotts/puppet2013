class puppet_master::repo {

  $repourl = "ssh://puppet.puppetclass.taoslab.com/srv/gitrepos/puppet"

  file { '/etc/puppet/repo':
    owner   => 'puppet',
    group   => 'puppet',
    mode    => '0644',
    ensure  => 'directory',
  }

  exec { 'checkout_repo':
    command => "git clone ${repourl} /etc/puppet/repo",
    path    => [ '/bin', '/usr/bin' ],
    user    => 'puppet',
    creates => '/etc/puppet/repo/.git',
  }

  exec { 'update_repo':
    command => 'git pull -X theirs',
    path    => [ '/bin', '/usr/bin' ],
    user    => 'puppet',
    cwd     => '/etc/puppet/repo',
  }

  File['/etc/puppet/repo']                     -> Exec['checkout_repo']
  File['/var/lib/puppet/.ssh/id_rsa']          -> Exec['checkout_repo']
  File['/var/lib/puppet/.ssh/authorized_keys'] -> Exec['checkout_repo']

  File['/var/lib/puppet/.ssh/id_rsa']          -> Exec['update_repo']
  File['/var/lib/puppet/.ssh/authorized_keys'] -> Exec['update_repo']

#  Exec['checkout_repo'] -> Exec['update_repo']
}
