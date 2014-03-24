class server::site::drone {
  include server::nginx_setup
  include server::ssl::ndjla

  nginx::resource::upstream { 'drone_app':
    members => [
      'localhost:3000',
    ],
  }

  nginx::resource::vhost { 'drone.ndj.la':
    proxy    => 'http://drone_app',
    ssl      => true,
    ssl_cert => $server::ssl::ndjla::cert,
    ssl_key  => $server::ssl::ndjla::key,
  }
}
