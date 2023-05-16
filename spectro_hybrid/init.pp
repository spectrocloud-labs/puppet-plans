plan spectro_hybrid(){
  apply_prep(localhost)
  apply(localhost) {

    class { 'postgresql::server':
      listen_addresses           => '0.0.0.0',
      ip_mask_deny_postgres_user => '0.0.0.0/32', # don't deny from anywhere
    }

    postgresql::server::pg_hba_rule { 'allow wordsmith api pods to access db database from anywhere':
      description => 'Open up trusted PostgreSQL for access from anywhere',
      type        => 'host',
      database    => 'postgres',
      user        => 'postgres',
      address     => '0.0.0.0/0',
      auth_method => 'trust',
      order       => 5,
    }
    
  }

}
