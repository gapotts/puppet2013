define git_server::repo ( $group = 'wheel' ) {
  include git_server

  file { "/srv/gitrepos/${name}":
    ensure => 'directory',
    group  => $group,
    mode   => '2770',
  }

  exec { "create_${name}_repo":
    command => "/usr/bin/git init --bare --shared=group /srv/gitrepos/${name}",
    creates => "/srv/gitrepos/${name}/HEAD",
    require => [ Package['git'],
                 File["/srv/gitrepos/${name}"],
               ],
  }
}

