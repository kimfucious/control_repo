class pasture::db {

  class { 'postgresql::server':
    listen_addresses => '*',
  }

  postgresql::server::db { 'pasture':
    user     => 'pasture',
    password => postgresql_password('pasture', 'm00m00'),
  }

  postgresql::server::pg_hba_rule { 'allow pasture app access':
    type        => 'host',
    database    => 'pasture',
    user        => 'pasture',
    address     => '192.168.1.53/24',
    auth_method => 'password',
  }

}
