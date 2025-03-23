resource "google_compute_network" "week_2_homework_vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}