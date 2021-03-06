class server::site::rabbit_management {
  include server::nginx_setup
  include server::ssl::ndjla

  firewall { "200 INPUT allow all to rabbit amqps port":
    action => 'accept',
    dport  => '5671',
  }   

  nginx::resource::upstream { 'rabbitmq_management':
    members => [
      'localhost:15672',
    ],
  }

  nginx::resource::vhost { 'mq.ndj.la':
    proxy            => 'http://rabbitmq_management',
    ssl              => true,
    ssl_cert         => $server::ssl::ndjla::cert,
    ssl_key          => $server::ssl::ndjla::key,
    rewrite_to_https => true,
    proxy_set_header => [
      'Host $host',
      'X-Real-IP $remote_addr',
      'X-Forwarded-For $proxy_add_x_forwarded_for',
      'X-Forwarded-Proto $scheme',
    ],
  }
}
