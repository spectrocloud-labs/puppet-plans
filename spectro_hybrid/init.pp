plan spectro_postgres(){
  apply_prep(localhost)
  apply(localhost) {

    class { 'postgresql::server':
      listen_addresses => '0.0.0.0',
      ensure => '10.0',
    }

    postgresql::server::db { 'db':
      user     => 'mydatabaseuser',
      password => postgresql::postgresql_password('mydatabaseuser', 'mypassword'),
    }
  }

}
