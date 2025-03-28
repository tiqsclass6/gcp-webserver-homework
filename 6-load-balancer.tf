resource "google_compute_health_check" "default" {
  name = "http-health-check"

  http_health_check {
    port         = 80
    request_path = "/"
  }

  check_interval_sec  = 10
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 2
}

resource "google_compute_backend_service" "web_backends" {
  name                            = "global-backend-service"
  load_balancing_scheme           = "EXTERNAL"
  protocol                        = "HTTP"
  port_name                       = "http"
  timeout_sec                     = 10
  connection_draining_timeout_sec = 0

  backend {
    group = google_compute_region_instance_group_manager.mig_us.instance_group
  }

  backend {
    group = google_compute_region_instance_group_manager.mig_europe.instance_group
  }

  health_checks = [google_compute_health_check.default.self_link]
}

resource "google_compute_url_map" "web_map" {
  name            = "web-url-map"
  default_service = google_compute_backend_service.web_backends.self_link
}

resource "google_compute_target_http_proxy" "web_proxy" {
  name    = "web-http-proxy"
  url_map = google_compute_url_map.web_map.self_link
}

resource "google_compute_global_forwarding_rule" "web_forwarding_rule" {
  name        = "web-forwarding-rule"
  target      = google_compute_target_http_proxy.web_proxy.self_link
  port_range  = "80"
  ip_protocol = "TCP"

  # Optional: Use a static IP address
  # ip_address = google_compute_global_address.lb_ip.address
}

# Optional: Reserve a global static IP
# resource "google_compute_global_address" "lb_ip" {
#   name = "lb-ip"
# }