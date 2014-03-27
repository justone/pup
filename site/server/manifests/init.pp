class server {
  include server::base

  include server::users::nate

  case $hostname {
    've15': {
      package { ['irssi']: ensure => installed }

      server::site { 've15.endot.org': }
    }
    'silo': {
      # nothing, yet
    }
    'digit': {
      include server::docker
      include server::site::drone
    }
  }
}
