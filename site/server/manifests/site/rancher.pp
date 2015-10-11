class server::site::rancher {
  include server::nginx_setup
  include server::ssl::ndjla

  nginx::resource::upstream { 'rancher_app':
    members => [
      'localhost:3001',
    ],
  }

  nginx::resource::vhost { 'ranch.ndj.la':
    proxy            => 'http://rancher_app',
    ssl              => true,
    ssl_cert         => $server::ssl::ndjla::cert,
    ssl_key          => $server::ssl::ndjla::key,
    rewrite_to_https => true,
    proxy_read_timeout => '900s',
    proxy_set_header => [
      'Host $host',
      'X-Real-IP $remote_addr',
      'X-Forwarded-For $proxy_add_x_forwarded_for',
      'X-Forwarded-Proto $scheme',
      'Upgrade $http_upgrade',
      'Connection "upgrade"',
    ],
    location_cfg_append => {
      'proxy_http_version' => '1.1',
    },
  }
}
