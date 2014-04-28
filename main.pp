# Always persist firewall rules
file { '/etc/iptables':
  ensure => directory,
} ->
exec { 'persist-firewall':
  command     => $operatingsystem ? {
    /(Ubuntu|Debian)/          => '/sbin/iptables-save > /etc/iptables/rules.v4',
    /(RedHat|CentOS)/ => '/sbin/iptables-save > /etc/sysconfig/iptables',
  },
  refreshonly => true,
}

# These defaults ensure that the persistence command is executed after 
# every change to the firewall, and that pre & post classes are run in the
# right order to avoid potentially locking you out of your box during the
# first puppet run.
Firewall {
  notify  => Exec['persist-firewall'],
  before  => Class['server::firewall::post'],
  require => Class['server::firewall::pre'],
}
Firewallchain {
  notify  => Exec['persist-firewall'],
}

# Purge unmanaged firewall resources
#
# This will clear any existing rules, and make sure that only rules
# defined in puppet exist on the machine
resources { "firewall":
  purge => false
}

include server
