plan spectro_postgres(){
  apply_prep(localhost)
  apply(localhost) {

    class { 'postgresql::server':
      listen_addresses => '0.0.0.0',
    }

    postgresql::server::db { 'postgres':
      ip_mask_deny_postgres_user => '0.0.0.0/32', # don't deny from anywhere
      ip_mask_allow_all_users    => '0.0.0.0/0',  # allow all users from anywhere
    }
  }

}
