terraform {
  backend "gcs" {
    bucket = "terrateam-demo-state"
    prefix = "/infrastructure/staging/compute/tf.state"
  }
}

provider "google" {
  project = "terrateam-sandbox"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_instance" "staging" {
  count        = 1
  name         = "staging-instance"
  machine_type = "e2-small"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
  }
}
