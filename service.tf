resource "google_compute_backend_service" "backend" {
  name        = "hello-world-backend"
  protocol    = "HTTP"
  backends {
    group = google_compute_instance_group.hello_world_instance_group.self_link
  }
}

resource "google_compute_url_map" "url_map" {
  name = "hello-world-url-map"
  default_url_redirect {
    https_redirect = false
    strip_query    = false
    prefix_redirect = "/hello"
  }
}

resource "google_compute_target_http_proxy" "http_proxy" {
  name    = "hello-world-http-proxy"
  url_map = google_compute_url_map.url_map.self_link
}

resource "google_compute_global_forwarding_rule" "forwarding_rule" {
  name       = "hello-world-forwarding-rule"
  target     = google_compute_target_http_proxy.http_proxy.self_link
  port_range = "80"
}
