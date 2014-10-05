class server::base {
  $packages = [
    'tmux',
    'tree',
    'git',
    'vim-nox',
    'curl',

    # system monitoring
    'iotop',
    'htop',

    # for fetching go packages
    'mercurial',
    'subversion',
  ]

  package { $packages:
    ensure => installed
  }
}
