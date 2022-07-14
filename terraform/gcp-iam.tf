// SERVICE ACCOUNT
resource "google_service_account" "redpoint_rtd" {
  for_each     = var.bigtable_instances
  account_id   = var.bigtable_instance_name
  display_name = var.bigtable_instance_name
  project      = each.value.project
  description  = "Service account used by Realtime to Access Bigtable"

  depends_on = [
    google_bigtable_instance.redpoint_rtd
  ]
}

// BIGTABLE IAM
resource "google_bigtable_table_iam_member" "bigtable_editor" {
  for_each = var.bigtable_tables
  table    = each.value.name
  instance = var.bigtable_instance_name
  role     = each.value.iam_role
  member   = each.value.iam_member

  depends_on = [
    google_bigtable_table.redpoint_rtd, google_service_account.redpoint_rtd
  ]
}

// BIGQUERY IAM
resource "google_bigquery_dataset_iam_member" "editor" {
  for_each   = var.bigquery_datasets
  dataset_id = each.value.dataset_id
  role       = each.value.iam_role
  member     = each.value.iam_member

  depends_on = [
    google_bigquery_dataset.redpoint_rtd, google_service_account.redpoint_rtd
  ]
}

// STORAGE
resource "google_storage_bucket_iam_member" "storage" {
  for_each = var.storage_buckets
  bucket   = each.value.name
  role     = each.value.iam_role
  member   = each.value.iam_member

  depends_on = [
    google_storage_bucket.redpoint_rtd, google_service_account.redpoint_rtd
  ]
}