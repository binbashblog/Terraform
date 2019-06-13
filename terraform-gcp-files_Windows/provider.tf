# Specify the provider (GCP, AWS, Azure)
provider "google" {
credentials = "${file("terraform.json")}"
project = "terraform-test-07062019"
region = "europe-west2-c"
}
