resource "google_project_iam_binding" "rpi" {
  count   = length(var.rp_interaction_iam_roles)
  project = var.gcp_project
  role    = element(var.rp_interaction_iam_roles, count.index)

  members = ["serviceAccount:redpoint-prod-rpi@paas-prod.iam.gserviceaccount.com",
    "serviceAccount:redpoint-prod-rtd@paas-prod.iam.gserviceaccount.com",
  "serviceAccount:redpoint-prod-rpdm@paas-prod.iam.gserviceaccount.com"]
}

