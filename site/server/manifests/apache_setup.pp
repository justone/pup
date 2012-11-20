class server::apache_setup {
  class { 'apache': }

  $site_base = '/var/sites'
  file { $site_base:
    ensure => directory,
  }
}
