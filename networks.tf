data "google_compute_network" "default" { # existing default network
  name = "default"
}

data "google_compute_network" "vpc1" { # existing custom network
  name = "vpc1"
}

data "google_compute_subnetwork" "vpc1_sn2" {
  name = "vpc1-sn2"
}
