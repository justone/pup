define server::site () {
  include server::apache_setup

  $site_dir = "${$server::apache_setup::site_base}/$name"
  $site_web = "${$server::apache_setup::site_base}/$name/web"

  file { [$site_dir, $site_web]:
    ensure => directory,
  }
  apache::vhost { $name:
    priority        => '10',
    docroot         => $site_web,
    port            => '80',
  }
}
