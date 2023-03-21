plan spectro_mysql(){
  apply_prep(localhost)
  apply(localhost) {

    class { 'mysql::server':
      root_password           => '',
      remove_default_accounts => false,
      restart                 => true,
    }

    mysql::db { 'db':
      user     => 'postgres',
      password => '',
      host     => 'localhost',
      grant    => ['SELECT', 'UPDATE'],
    }
  }

}
