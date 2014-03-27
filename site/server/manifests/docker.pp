class server::docker {
  include apt

  package { 'lxc-docker':
    require => Class['apt::update'],
    ensure  => present,
  }

  apt::source { 'docker':
    location    => 'http://get.docker.io/ubuntu',
    release     => 'docker',
    key         => 'A88D21E9',
    include_src => false,
    key_source  => 'https://get.docker.io/gpg',
  }
}
