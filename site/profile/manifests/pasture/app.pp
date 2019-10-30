class profile::pasture::app {
  if $facts['fqdn'] =~ 'client-01' {
    $default_character = 'elephant'
    $db                = 'postgres://pasture:m00m00@puppet-client-03.hof.prv/pasture'
  } elsif $facts['fqdn'] =~ 'client-02' {
    $default_character = 'cow'
    $db                = 'none'
  } else {
    fail("The ${facts['fqdn']} node name must match 'client-01' or 'client-02'.")
  }
  class { 'pasture':
    default_message   => 'Hello Puppet!',
    sinatra_server    => 'thin',
    default_character => $default_character,
    db                => $db,
  }
}
