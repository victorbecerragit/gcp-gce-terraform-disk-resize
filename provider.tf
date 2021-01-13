# Specify the provider (GCP, AWS, Azure)
provider "google" {
 credentials = "${file("admin-gcp.json")}"
 project = "ambient-highway-298211"
 region = "us-central1"
}
