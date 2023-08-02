
provider "google"{
  project = "imposing-voyage-392509"
  region = "us-central1"
  # credentials = "keys.json"
}

module "cloudrun" {
    source = "./modules"
    cloudrun_job_name = "demo-job"
    Cloud_Run_image = "bharath5565/project-4"
    Cloud_Run_location = "us-central1"

  
}
#Create a storage buckect to store the terraform state file
resource "google_storage_bucket" "GCS1" {
  name          = "2-storage-buckect"
  storage_class = "STANDARD"  # Set the initial storage class to STANDARD
  location      = "us-central1"
  force_destroy = true
  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }
}

terraform {
  backend "gcs" {
    bucket = "2-storage-buckect"
    prefix = "sftp-to-bucket/terraform.tfstate"
    # credentials = "./keys.json"
  }
}