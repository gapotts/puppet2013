
class yum::epel {

  package { 'epel-release':
    ensure   => 'installed',
    provider => 'rpm',
    source   => 'http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm',
    before   => Yumrepo['epel'],
  }

  yumrepo { 'epel':
    enabled => '1',
  }

}
