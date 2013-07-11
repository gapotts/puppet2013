
class cron {
  package { 'cronie':
    ensure => 'installed',
  }
}
