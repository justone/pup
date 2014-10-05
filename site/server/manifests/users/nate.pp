class server::users::nate {
    if defined(Class['server::docker']) {
        $groups = ['docker']
    } else {
        $groups = []
    }

    user { 'nate':
      managehome => true,
      ensure     => present,
      comment    => 'Nate Jones',
      shell      => '/bin/bash',
      groups     => $groups
    }

    # ensure that user is created/updated after docker is installed so the
    # docker group exists
    if defined(Class['server::docker']) {
        Class['server::docker'] -> User['nate']
    }
}
