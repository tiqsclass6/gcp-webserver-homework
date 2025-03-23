output "web_server_public_ip" {
  description = "External (public) IP"
  value       = google_compute_instance.week_2_homework_vm.network_interface[0].access_config[0].nat_ip
}