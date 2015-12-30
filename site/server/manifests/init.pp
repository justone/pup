class server {
  include server::base

  case $hostname {
    've15': {
      package { ['irssi']: ensure => installed }

      server::site { 've15.endot.org': }
    }
    'silo': {
      include server::docker
      include server::hardware
    }
    /^digit/: {
      include server::docker
      include server::site::drone
      include server::site::rabbit_management
      include server::site::pmb_github

      class { 'server::firewall': }
    }
  }

  include server::users::nate

}
