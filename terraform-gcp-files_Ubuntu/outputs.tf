  output "external_ip" {
    value = "${google_compute_instance.terraform-gcp-ubuntu.network_interface.0.access_config.0.assigned_nat_ip}"
  }
