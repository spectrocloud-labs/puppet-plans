plan spectro_postgres(){
  apply_prep(localhost)
  apply(localhost) {

    class { 'postgresql::server':
      listen_addresses           => '0.0.0.0',
      ip_mask_deny_postgres_user => '0.0.0.0/32', # don't deny from anywhere
      ip_mask_allow_all_users    => '0.0.0.0/0',  # allow all users from anywhere
      #password_encryption        => 'md5',        # need to switch this away from scram-sha-256
    }

    postgresql::server::pg_hba_rule { 'allow wordsmith api pods to access db database':
      description => 'Open up PostgreSQL for access from anywhere',
      type        => 'host',
      database    => 'db',
      user        => 'postgres',
      address     => '0.0.0.0/0',
      auth_method => 'trust',
    }

    postgresql::server::db { 'db':
      user     => 'dummy_user',                   # app will be connecting with the builtin Postgres user
      password => 'dummy_password',
    }
  }

}
