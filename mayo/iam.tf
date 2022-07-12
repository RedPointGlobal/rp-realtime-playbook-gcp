// SERVICE ACCOUNT
resource "google_service_account" "bigtable" {
  for_each     = var.bigtable_instances
  account_id   = var.bigtable_table_instance_name
  display_name = var.bigtable_table_instance_name
  project      = each.value.project
  description  = "Service account used by Realtime to Access Bigtable"

  depends_on = [
    google_bigtable_instance.redpoint_rtd
  ]
}

// BIGTABLE IAM
resource "google_bigtable_table_iam_member" "bigtable_editor" {
  for_each = var.bigtable_tables
  table       = each.value.name
  instance    = var.bigtable_table_instance_name
  role        = "roles/bigtable.user"
  member      = "serviceAccount:redpoint-realtime-dev@devops-188816.iam.gserviceaccount.com"
}

// BIGQUERY IAM
resource "google_bigquery_dataset_iam_member" "editor" {
  for_each   = var.bigquery_datasets
  dataset_id = each.value.dataset_id
  role       = "roles/bigquery.dataEditor"
  member     = "serviceAccount:redpoint-realtime-dev@devops-188816.iam.gserviceaccount.com"
}