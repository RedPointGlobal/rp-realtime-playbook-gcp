resource "google_bigtable_instance" "redpoint_rtd" {
  for_each     = var.bigtable_instances
  name         = var.bigtable_instance_name
  display_name = var.bigtable_instance_name
  project      = var.gcp_project

  cluster {
    cluster_id   = var.bigtable_instance_name
    zone         = each.value.zone
    storage_type = each.value.storage_type

    autoscaling_config {
      min_nodes  = 3
      max_nodes  = 6
      cpu_target = 60
    }
  }

  labels = var.core_labels

  lifecycle {
    prevent_destroy = false
  }
}

resource "google_bigtable_table" "redpoint_rtd" {
  for_each = var.bigtable_tables
  name     = each.value.name
  project  = each.value.project

  column_family {
    family = each.value.column_family
  }
  instance_name = "projects/${var.gcp_project}/instances/${var.bigtable_instance_name}"
  split_keys    = each.value.split_keys

  lifecycle {
    prevent_destroy = false
  }

  depends_on = [
    google_bigtable_instance.redpoint_rtd
  ]
}

