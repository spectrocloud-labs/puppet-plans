plan spectro_postgres(){
  apply_prep(localhost)
  apply(localhost) {

    class { 'postgresql::server':
      listen_addresses           => '0.0.0.0',
      ip_mask_deny_postgres_user => '0.0.0.0/32', # don't deny from anywhere
      ip_mask_allow_all_users    => '0.0.0.0/0',  # allow all users from anywhere
      password_encryption        => 'md5',        # need to switch this away from scram-sha-256
    }

    postgresql::server::db { 'db':
      user     => 'dummy_user',                   # app will be connecting with the builtin Postgres user
      password => 'dummy_password',
    }
  }

}
