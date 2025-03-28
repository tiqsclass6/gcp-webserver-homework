provider "google" {
  credentials = file("${path.module}/<INSERT-JSON-FILEPATH-HERE>")
  project     = "<PROJECT ID HERE>"
  region      = var.region
  zone        = var.zone
}