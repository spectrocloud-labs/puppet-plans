plan spectro_postgres(){
  apply_prep(localhost)
  apply(localhost) {

    class { 'postgresql::server':
      listen_addresses => '0.0.0.0',
      ensure => '10.0',
      postgres_password => '',
    }

    postgresql::server::db { 'postgres':
      user     => 'postgres',
      password => postgresql::postgresql_password('postgres', ''),
    }

    package { 'postgresql-client':
      ensure => 'installed',
    }
  }

}
