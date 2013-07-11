
File {
  owner => 'root',
  group => 'root',
  mode  => '0644'
}

node default {
  include dns_client
  include iptables::disabled
  include sudo
  include cron
  include puppet_standalone
}

node 'dns.puppetclass.taoslab.com' inherits default {
  class { 'dns_server':
    type => 'master',
  }
}

node 'puppet.puppetclass.taoslab.com' inherits default {
  git_server::repo { 'puppet': }
}
