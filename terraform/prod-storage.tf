resource "google_storage_bucket" "redpoint_rtd" {
  for_each      = var.storage_buckets
  name          = each.value.name
  location      = each.value.location
  project       = each.value.project
  storage_class = each.value.storage_class
  force_destroy = false
  labels        = var.core_labels
  versioning {
    enabled = each.value.versioning_enabled
  }
}

