# Specify the provider (GCP, AWS, Azure)

  provider "google" {
    credentials 	= "${file("terraform.json")}"
    region 	= "${var.region}"
    project 	= "${var.project_id}"
  }
