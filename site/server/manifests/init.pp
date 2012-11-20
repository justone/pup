class server {
  include server::base

  server::site { 'domain.com': }
}
