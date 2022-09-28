variable "gcp_credentials" {
  type        = string
  description = "Key file attached to the service account used by Terraform"

}

variable "bigtable_instance_name" {
  type = string
}

variable "gcp_project" {
  type        = string
  description = "ID of GCP Project in which terraform will deploy resources"
}

variable "storage_buckets" {
  type = map(object({
    name               = string
    location           = string
    project            = string
    storage_class      = string
    versioning_enabled = bool
    iam_role           = string
    iam_member         = string
  }))
}

variable "gcp_region" {
  type        = string
  description = "GCP region in which tterraform will deploy resources"
}

variable "gcp_zone" {
  type        = string
  description = "GCP zone which tterraform will deploy resources "
}

variable "core_labels" {
  type = map(string)
}

variable "bigtable_instances" {
  type = map(object({
    zone         = string
    storage_type = string
    project      = string
    autoscaling_config = object({
      min_nodes  = number
      max_nodes  = number
      cpu_target = number
    })
  }))
}

variable "bigtable_tables" {
  type = map(object({
    name          = string
    column_family = string
    project       = string
    split_keys    = list(string)
    iam_role      = string
    iam_member    = string
    iam_role      = string
    iam_member    = string
  }))

}

variable "bigquery_datasets" {
  type = map(object({
    friendly_name                   = string
    project                         = string
    dataset_id                      = string
    description                     = string
    location                        = string
    default_table_expiration_ms     = number
    default_partition_expiration_ms = number
    delete_contents_on_destroy      = bool
    iam_role                        = string
    iam_member                      = string
  }))
}