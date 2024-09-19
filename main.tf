
# Networks config

data "google_compute_network" "default" {
  name = "default"
}

data "google_compute_network" "vpc1" {
  name = "vpc1"
}
