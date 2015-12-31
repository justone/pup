class server::site::pmb_github {
  include server::nginx_setup
  include server::ssl::ndjla

  nginx::resource::upstream { 'pmb_github':
    members => [
      'localhost:3001',
    ],
  }

  nginx::resource::vhost { 'gh.ndj.la':
    proxy            => 'http://pmb_github',
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
