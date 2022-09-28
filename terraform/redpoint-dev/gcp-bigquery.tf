resource "google_bigquery_dataset" "redpoint_rtd" {
  for_each      = var.bigquery_datasets
  dataset_id    = each.value.dataset_id
  friendly_name = each.value.friendly_name
  project       = each.value.project
  description   = each.value.description
  location      = each.value.location

  labels = var.core_labels
}


