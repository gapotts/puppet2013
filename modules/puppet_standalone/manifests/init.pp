
class puppet_standalone {

  include puppet_standalone::user

  file { '/etc/puppet':
    owner  => 'puppet',
    group  => 'puppet',
    ensure => 'directory',
  }

  file { '/etc/puppet/repo':
    owner  => 'puppet',
    group  => 'puppet',
    ensure  => 'directory',
  }

  file { '/usr/local/sbin/run_puppet_apply':
    owner  => 'root',
    group  => 'root',
    mode   => '0544',
    source => 'puppet:///modules/puppet_standalone/usr/local/sbin/run_puppet_apply.sh',
  }

  $offset = fqdn_rand(30)

  cron { 'puppet_apply':
    command => '/usr/local/sbin/run_puppet_apply',
    user    => 'root',
    minute  => [ $offset, $offset + 30 ],
  }

  File['/etc/puppet/repo']                 -> Cron['puppet_apply']
  File['/usr/local/sbin/run_puppet_apply'] -> Cron['puppet_apply'] 

  # Defined in puppet_standalone::user
  File['/var/lib/puppet/.ssh/id_rsa']          -> Cron['puppet_apply']
  File['/var/lib/puppet/.ssh/authorized_keys'] -> Cron['puppet_apply']
  File['/var/lib/puppet/.ssh/config']          -> Cron['puppet_apply']

}
