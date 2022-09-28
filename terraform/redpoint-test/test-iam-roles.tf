resource "google_project_iam_binding" "rpi" {
  count   = length(var.rp_interaction_iam_roles)
  project = var.gcp_project
  role    = element(var.rp_interaction_iam_roles, count.index)

  members = var.service_accounts
}
