output "load_balancer_ip" {
  description = "The global static IP address of the HTTP(S) load balancer"
  value       = google_compute_global_forwarding_rule.web_forwarding_rule.ip_address
}