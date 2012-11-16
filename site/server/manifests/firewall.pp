class server::firewall {
  include server::firewall::pre
  include server::firewall::post

  firewall { "200 INPUT allow all to ssh ports":
    action => 'accept',
    dport  => '22',
  }   

  firewall { "200 INPUT allow all to http ports":
    action => 'accept',
    dport  => '80',
  }   

}
