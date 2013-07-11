define apache::vhost { 
  file { "/etc/httpd/conf.d/${name}.conf":
    mode   => '0444',
    source => "puppet:///modules/apache/etc/httpd/conf.d/${name}.conf",
    notify => Service['httpd'],
  }
}
