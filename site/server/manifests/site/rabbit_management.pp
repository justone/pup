class server::site::rabbit_management {
  include server::nginx_setup
  include server::ssl::ndjla

  nginx::resource::upstream { 'rabbitmq_management':
    members => [
      'localhost:25672',
    ],
  }

  nginx::resource::vhost { 'mq.ndj.la':
    proxy            => 'http://rabbitmq_management',
    ssl              => true,
    ssl_cert         => $server::ssl::ndjla::cert,
    ssl_key          => $server::ssl::ndjla::key,
  }
}
