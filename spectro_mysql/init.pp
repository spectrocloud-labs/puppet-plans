plan spectro_mysql(){
  apply_prep(localhost)
  apply(localhost) {

    class { 'mysql::server':
      root_password           => 'strongpassword',
      remove_default_accounts => true,
      restart                 => true,
    }

  }

}
