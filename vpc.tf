resource "google_compute_network" "vpc_network" {
  name = "hello-world-vpc"
}

resource "google_compute_subnetwork" "subnetwork" {
  name          = "hello-world-subnetwork"
  network       = google_compute_network.vpc_network.name
  ip_cidr_range = "10.0.0.0/24"
  region        = "us-central1"
}
