class server::users::nate {
    user { 'nate':
      managehome => true,
      ensure => present,
      comment => 'Nate Jones',
    }
}
