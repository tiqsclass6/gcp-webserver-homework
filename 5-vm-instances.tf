resource "google_compute_firewall" "allow_http" {
  name    = "allow-http"
  network = google_compute_network.week_2_homework_vpc.name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server"]
}

resource "google_compute_instance" "week_2_homework_vm" {
  name         = "web-server"
  machine_type = "e2-micro"
  zone         = var.zone
  tags         = ["http-server"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network    = google_compute_network.week_2_homework_vpc.id
    subnetwork = google_compute_subnetwork.private_subnet.id
    access_config {}
  }

  metadata = {
    VPC_NAME = var.vpc_name
  }

  metadata_startup_script = file("${path.module}/startup-script.sh")

  service_account {
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}