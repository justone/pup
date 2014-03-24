class server::ssl::ndjla {
  include server::ssl

  $cert = "${$server::ssl::base_dir}/ndj.la.cert.pem"
  $key = "${$server::ssl::base_dir}/ndj.la.key.pem"

  File { mode => 0640 }

  file { $cert:
    source => "puppet:///modules/server/ssl/ndj.la/cert.pem",
  }
  file { $key:
    source => "puppet:///modules/server/ssl/ndj.la/key.pem",
  }
}
