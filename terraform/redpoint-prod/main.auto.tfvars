/////////// TERRAFORM PROVISIONER
gcp_credentials = "your_service_account_key.json"
gcp_project     = "your_project_id"
gcp_region      = "us-central1"
gcp_zone        = "us-central1-a"

/////////// LABELS
core_labels = {
  "application" = "redpoint-interaction"
  "env"         = "prod"
  "vendor"      = "redpoint"
}

// IAM ROLES
rp_interaction_iam_roles = [
  "roles/bigquery.dataEditor",
  "roles/bigquery.jobUser",
  "roles/bigquery.dataViewer",
  "roles/bigquery.user",
"roles/storage.objectAdmin",
"roles/bigtable.admin"]

// SERVICE ACCOUNTS
service_accounts = [
  "serviceAccount:redpoint-prod-rpi@paas-prod.iam.gserviceaccount.com",
  "serviceAccount:redpoint-prod-rtd@paas-prod.iam.gserviceaccount.com",
"serviceAccount:redpoint-prod-rpdm@paas-prod.iam.gserviceaccount.com"]

/////////// BIG TABLE
bigtable_instance_name = "rpprod-bigtable-instance"

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
    name          = "RPPRODnteractionData"
    project       = "your_project_id"
    split_keys    = ["a", "b", "c"]
  }

  "cache" = {
    column_family = "rpi"
    name          = "RPPRODInteractionCache"
    project       = "your_project_id"
    split_keys    = ["a", "b", "c"]
  }
}

/////////// BIGQUERY
bigquery_datasets = {

  "ops_db" = {
    description                     = "Redpoint Realtime Marketing Ops DB"
    friendly_name                   = "RPPRODCDPMarketingOPS"
    location                        = "us-central1"
    project                         = "your_project_id"
    dataset_id                      = "RPprodCDPMarketingOPS"
    delete_contents_on_destroy      = true

  }

  "pii_vault" = {
    description                     = "Redpoint Realtime PII Vault"
    friendly_name                   = "RPPRODCDPPiiVAULT"
    location                        = "us-central1"
    project                         = "your_project_id"
    dataset_id                      = "RPprodCDPPiiVAULT"
    delete_contents_on_destroy      = true
  }

  "offer_history" = {
    description                     = "Redpoint Offer History"
    friendly_name                   = "RPPRODCDPOfferHistory"
    location                        = "us-central1"
    project                         = "your_project_id"
    dataset_id                      = "RPprodCDPOfferHistory"
    delete_contents_on_destroy      = true
  }

  "large_data_sets" = {
    description                     = "Redpoint Large Datasets"
    friendly_name                   = "rpprod_cdp_lr_prod"
    location                        = "us-central1"
    project                         = "your_project_id"
    dataset_id                      = "rpprod_cdp_lr_prod"
    delete_contents_on_destroy      = true
  }
}

/////////// STORAGE
storage_buckets = {

  "prod" = {
    location           = "US"
    name               = "rpprodcdp-storage-bucket"
    project            = "your_project_id"
    storage_class      = "MULTI_REGIONAL"
    versioning_enabled = true
  }
}


