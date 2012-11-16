class server {
  package { ['git', 'vim-nox']: ensure => installed }

  class { 'server::firewall': }
}
