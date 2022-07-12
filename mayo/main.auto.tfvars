/////////// TERRAFORM PROVISIONER
gcp_credentials = "devops-188816-b939c40c301b.json"
gcp_project     = "devops-188816"
gcp_region      = "us-east1"
gcp_zone        = "us-east1-b"

/////////// LABELS
core_labels = {
  "application" = "redpoint-realtime-plus-agent"
  "env"         = "production"
  "vendor"      = "redpoint"
}

/////////// BIG TABLE
bigtable_table_instance_name = "redpoint-realtime-dev"

bigtable_instances = {

  "dev" = {
    autoscaling_config = {
      cpu_target = 60
      max_nodes  = 20
      min_nodes  = 3
    }
    project      = "devops-188816"
    storage_type = "SSD"
    zone         = "us-east1-b"
  }
}

bigtable_tables = {

  "aux" = {
    column_family = "customerName"
    name          = "rpiData"
    project       = "devops-188816"
    split_keys    = ["a", "b", "c"]
  }

  "cache" = {
    column_family = "rpi"
    name          = "rpiCache"
    project       = "devops-188816"
    split_keys    = ["a", "b", "c"]
  }
}

/////////// BIGQUERY
bigquery_datasets = {

  "ops_db" = {
    default_partition_expiration_ms = 3600000
    default_table_expiration_ms     = 3600000
    description                     = "Redpoint Realtime Marketing Ops DB"
    friendly_name                   = "realtime-ops-db"
    location                        = "us-east1"
    project                         = "devops-188816"
    dataset_id                      = "CDPMarketingOPS"
    delete_contents_on_destroy      = true
  }

  "pii_vault" = {
    default_partition_expiration_ms = 3600000
    default_table_expiration_ms     = 3600000
    description                     = "Redpoint Realtime PII Vault"
    friendly_name                   = "realtime-pii-vault"
    location                        = "us-east1"
    project                         = "devops-188816"
    dataset_id                      = "CDPPiiVAULT"
    delete_contents_on_destroy      = true
  }
}

/////////// STORAGE
storage_buckets = {

  "dev" = {
    location = "US"
    name = "redpoint-realtime-dev"
    project = "devops-188816"
    storage_class = "MULTI_REGIONAL"
    versioning_enabled = true
  }
}