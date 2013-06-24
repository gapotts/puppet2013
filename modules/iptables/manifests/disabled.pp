
class iptables::disabled {
  service { 'iptables':
    ensure   => 'stopped',
    enable   => 'false',
    provider => 'redhat',
  }
}
