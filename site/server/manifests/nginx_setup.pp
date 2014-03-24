class server::nginx_setup {
  class { 'nginx': }

  $site_base = '/var/sites'
  file { $site_base:
    ensure => directory,
  }
}
