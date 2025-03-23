provider "google" {
  credentials = file("C:/Users/bjett/Documents/TheoWAF/class6.5/GCP/Terraform/class-6-5-tiqs-095c33bf9f57.json")
  project     = "class-6-5-tiqs"
  region      = var.region
  zone        = var.zone
}