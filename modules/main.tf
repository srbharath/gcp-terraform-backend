resource "google_cloud_run_v2_job" "default" {
  name     = var.cloudrun_job_name
  location = "us-central1"

  template {
    template {
      containers {
        image = var.Cloud_Run_image
      }
#   vpc_access {
#     connector = google_vpc_access_connector.default.id
#       egress    = "ALL_TRAFFIC"
#     }
    }
  }
}