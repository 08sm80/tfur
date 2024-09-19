provider "google" { # google provider
  project     = "learn-tf-code"
  region      = "us-central1"
  credentials = "/d/Code/keys/learn-tf-code-84e45c1a1298.json"
}

terraform { # terraform provider for GCP
  required_providers {
    google = {
      version = "~> 4.0.0"
    }
  }
}
