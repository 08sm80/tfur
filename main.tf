
# Networks config

data "google_compute_network" "default" { # existing default network
  name = "default"
}

data "google_compute_network" "vpc1" { # existing custom network
  name = "vpc1"
}

data "google_compute_subnetwork" "vpc1_sn2" {
  name = "vpc1-sn2"
}

# Compute

data "google_service_account" "compute_sa" {
  account_id = "default-sa"
}

resource "google_compute_instance" "gce_vm1" {
  name         = "gce-vm1"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  tags = ["test", "gce"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        type = "system"
      }

    }
  }

  network_interface {
    subnetwork = data.google_compute_subnetwork.vpc1_sn2.id

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    ninja = "level-1"
  }

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = data.google_service_account.compute_sa.email
    scopes = ["cloud-platform"]
  }
}


resource "google_compute_firewall" "basic_access" {
  network = data.google_compute_network.vpc1.id
  name    = "basic-access"
  allow {
    protocol = "TCP"
    ports    = ["80", "443", "22"]
  }
  source_ranges = ["0.0.0.0/0"]
}
