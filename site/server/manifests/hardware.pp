class server::hardware {
  $packages = [
    'smartmontools',
  ]

  package { $packages:
    ensure => installed
  }
}
