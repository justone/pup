class server::ssl {
  $base_dir = '/etc/certs'
  file { $base_dir:
    ensure => directory,
  }
}
