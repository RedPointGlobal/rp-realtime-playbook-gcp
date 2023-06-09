resource "google_project_iam_binding" "rpi" {
  count   = length(var.rp_interaction_iam_roles)
  project = var.gcp_project
  role    = element(var.rp_interaction_iam_roles, count.index)

  members = ["serviceAccount:redpoint-prod-rpi@${var.gcp_project}.iam.gserviceaccount.com",
    "serviceAccount:redpoint-prod-rtd@${var.gcp_project}.iam.gserviceaccount.com",
  "serviceAccount:redpoint-prod-rpdm@${var.gcp_project}.iam.gserviceaccount.com"]
}

