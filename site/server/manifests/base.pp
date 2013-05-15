class server::base {
  package { ['tree', 'git', 'vim-nox']: ensure => installed }

  class { 'server::firewall': }
}
