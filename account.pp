
define account (
  $ensure = 'present',
  $gecos  = undef,
  $uid    = undef,
  $gid    = $uid,
  $groups = undef,
  $shell  = '/bin/bash',
  $home   = "/home/${name}",
  $mode   = '0600',
) {

  if ( $gid == $uid ) {
    group {
      $name:
        ensure => $ensure,
        gid    => $gid,
    }
  }

  user {
    $name:
      ensure  => $ensure,
      comment => $gecos,
      uid     => $uid,
      gid     => $gid,
      groups  => $groups,
      home    => $home,
      shell   => $shell;
  }

  if ( $ensure == 'present' ) {
    file {
      "/home/${name}":
        ensure  => 'directory',
        owner   => $uid,
        group   => $gid,
        mode    => '0600',
        recurse => 'remote',
        purge   => 'false',
        replace => 'false',
        source  => '/etc/skel',
        require => User[$name],
    }
  }
}

