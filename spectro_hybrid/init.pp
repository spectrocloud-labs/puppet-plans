plan spectro_hybrid(){
  apply_prep(localhost)
  apply(localhost) {

    class { 'postgresql::server':
      listen_addresses           => '0.0.0.0',
      ip_mask_deny_postgres_user => '0.0.0.0/32', # don't deny from anywhere
    }

    postgresql::server::pg_hba_rule { 'allow wordsmith api pods 1 to access db database':
      description => 'Open up trusted PostgreSQL for access from pod network',
      type        => 'host',
      database    => 'postgres',
      user        => 'postgres',
      address     => '192.168.0.0/16',
      auth_method => 'trust',
      order       => 5,
    }
    
    postgresql::server::pg_hba_rule { 'allow wordsmith api pods 2 to access db database':
      description => 'Open up trusted PostgreSQL for access from pod network',
      type        => 'host',
      database    => 'postgres',
      user        => 'postgres',
      address     => '100.64.0.0/16',
      auth_method => 'trust',
      order       => 6,
    }

  }

}
