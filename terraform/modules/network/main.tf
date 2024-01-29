# network main

resource "google_compute_network" "default" {
    name = "${var.app_name}-vpc"
    auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "default" {
  name          = "public-1"
  ip_cidr_range = "10.0.0.0/24"
  network       = google_compute_network.default.id
}