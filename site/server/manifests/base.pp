class server::base {
  package { ['tmux', 'tree', 'git', 'vim-nox']: ensure => installed }
}
