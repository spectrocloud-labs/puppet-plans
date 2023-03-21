plan spectro_mysql(){
  apply_prep(localhost)
  apply(localhost) {

    class { 'postgresql::server':
      postgres_password => '',
    }

    postgresql::server::db { 'db':
      user     => 'mydatabaseuser',
      password => postgresql::postgresql_password('mydatabaseuser', 'mypassword'),
    }
  }

}
