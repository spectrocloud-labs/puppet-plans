plan spectro_postgres(){
  apply_prep(localhost)
  apply(localhost) {

    class { 'postgresql::server': }

    postgresql::server::db { 'db':
      user     => 'mydatabaseuser',
      password => postgresql::postgresql_password('mydatabaseuser', 'mypassword'),
    }
  }

}
