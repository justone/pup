class server::base {
  package { ['git', 'vim-nox']: ensure => installed }

  class { 'server::firewall': }
}
