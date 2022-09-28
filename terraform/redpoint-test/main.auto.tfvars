/////////// TERRAFORM PROVISIONER
gcp_credentials = "your_service_account_key.json"
gcp_project     = "your_project_id"
gcp_region      = "us-central1"
gcp_zone        = "us-central1-a"

/////////// LABELS
core_labels = {
  "application" = "redpoint-interaction"
  "env"         = "test"
  "vendor"      = "redpoint"
}

// IAM ROLES
rp_interaction_iam_roles = [
  "roles/bigquery.dataEditor",
  "roles/bigquery.jobUser",
  "roles/bigquery.dataViewer",
  "roles/bigquery.user",
"roles/storage.objectAdmin"]

// SERVICE ACCOUNTS
service_accounts = [
  "serviceAccount:redpoint-test-rpi@paas-prod.iam.gserviceaccount.com",
  "serviceAccount:redpoint-test-rtd@paas-prod.iam.gserviceaccount.com",
"serviceAccount:redpoint-test-rpdm@paas-prod.iam.gserviceaccount.com"]

/////////// BIG TABLE
bigtable_instance_name = "rptest-bigtable-instance"

bigtable_instances = {

  "uscentral" = {
    autoscaling_config = {
      cpu_target = 60
      max_nodes  = 20
      min_nodes  = 3
    }
    project      = "your_project_id"
    storage_type = "SSD"
    zone         = "us-central1-a"
  }
}

bigtable_tables = {

  "aux" = {
    column_family = "customerName"
    name          = "RPTESTnteractionData"
    project       = "your_project_id"
    split_keys    = ["a", "b", "c"]
  }

  "cache" = {
    column_family = "rpi"
    name          = "RPTESTInteractionCache"
    project       = "your_project_id"
    split_keys    = ["a", "b", "c"]
  }
}

/////////// BIGQUERY
bigquery_datasets = {

  "ops_db" = {
    description                = "Redpoint Realtime Marketing Ops DB"
    friendly_name              = "RPTESTCDPMarketingOPS"
    location                   = "us-central1"
    project                    = "your_project_id"
    dataset_id                 = "RPTESTCDPMarketingOPS"
    delete_contents_on_destroy = true

  }

  "pii_vault" = {
    description                = "Redpoint Realtime PII Vault"
    friendly_name              = "RPTESTCDPPiiVAULT"
    location                   = "us-central1"
    project                    = "your_project_id"
    dataset_id                 = "RPTESTCDPPiiVAULT"
    delete_contents_on_destroy = true
  }

  "offer_history" = {
    description                = "Redpoint Offer History"
    friendly_name              = "RPTESTCDPOfferHistory"
    location                   = "us-central1"
    project                    = "your_project_id"
    dataset_id                 = "RPTESTCDPOfferHistory"
    delete_contents_on_destroy = true
  }

  "large_data_sets" = {
    description                = "Redpoint Large Datasets"
    friendly_name              = "rptest_cdp_lr_test"
    location                   = "us-central1"
    project                    = "your_project_id"
    dataset_id                 = "rptest_cdp_lr_test"
    delete_contents_on_destroy = true
  }
}

/////////// STORAGE
storage_buckets = {

  "test" = {
    location           = "US"
    name               = "rptestcdp-storage-bucket"
    project            = "your_project_id"
    storage_class      = "MULTI_REGIONAL"
    versioning_enabled = true
  }
}


