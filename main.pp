# Ensure that the firewall pre and post are run at the right times, to avoid
# lock out
Firewall {
  before  => Class['server::firewall::post'],
  require => Class['server::firewall::pre'],
}

# Don't purge resources, this allows docker to coexist
resources { "firewall":
  purge => false
}

# And, of course, include basic firewall support
class { 'firewall': }

include server
