provider "google" {
  credentials = file("<insert file path here>") # Insert your .json file here
  project     = "<PROJECT ID>" # Insert Project ID here
  region      = var.region
  zone        = var.zone
}