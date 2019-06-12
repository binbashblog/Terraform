resource "google_compute_instance" "terraform-gcp-ubuntu" {
  name		= "terraform-gcp-ubuntu"
  machine_type	= "n1-standard-2"
  zone		= "europe-west2-c"

  tags = ["ubuntu", "terraform"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }
  
  scratch_disk {
    
  }

  network_interface {
      network = "default"

      access_config {

      }
  }

  metadata {
    sshKeys = "ubuntu:${file(var.ssh_public_key_filepath)}"
  }
}
