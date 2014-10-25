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

    'perl-doc',
  ]

  package { $packages:
    ensure => installed
  }
}
