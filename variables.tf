# GCE region to use.
variable "gce_region" {
  default = "us-central1"
}

# GCE zone to use.
variable "gce_zone" {
  default = "us-central1-b"
}

# GCE image name.
variable "gce_ubuntu_1804" {
  default = "ubuntu-os-cloud/ubuntu-minimal-1804-bionic-v20190429"
}

# GCE machine type.
variable "gce_machine_type" {
  default = "n1-standard-1"
}

# If you use `gcloud compute ssh` or `gcloud compute copy-files`, you may want
# to leave this as "google_compute_engine" for convenience.
variable "key_name" {
  default = "google_compute_engine"
}

# Number of instances to start.
variable "num_instances" {
}

variable "root_disk_size_gb" {
  #default = 15
  default = 20
}

variable "vm_size" {
  #default = n1-standard-1
  default = "n2d-custom-2-4096"
}
