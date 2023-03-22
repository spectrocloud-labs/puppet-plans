plan spectro_postgres(){
  apply_prep(localhost)
  apply(localhost) {

    class { 'postgresql::server':
      listen_addresses => '0.0.0.0',
      ensure => '10.0',
      postgres_password => '',
    }
  }

}
