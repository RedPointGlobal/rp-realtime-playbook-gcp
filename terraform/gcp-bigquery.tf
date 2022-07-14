resource "google_bigquery_dataset" "redpoint_rtd" {
  for_each                        = var.bigquery_datasets
  dataset_id                      = each.value.dataset_id
  friendly_name                   = each.value.friendly_name
  project                         = each.value.project
  description                     = each.value.description
  location                        = each.value.location
  default_table_expiration_ms     = each.value.default_table_expiration_ms
  default_partition_expiration_ms = each.value.default_partition_expiration_ms
  delete_contents_on_destroy      = each.value.delete_contents_on_destroy

  labels = var.core_labels
}


