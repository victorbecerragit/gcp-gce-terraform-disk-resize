# Create a new instance
data "google_compute_image" "my_image" {
  family  = "debian-9"
  project = "debian-cloud"
}

resource "google_compute_disk" "boot-disk" {
  name  = "root-disk"
  zone  = "us-central1-a"
  // only use an image data source if you're ok with the disk recreating itself with a new image periodically
  image = data.google_compute_image.my_image.self_link
  size  = var.root_disk_size_gb
}

resource "google_compute_instance" "ubuntu-xenial" {
   name = "ubuntu-xenial"
   machine_type = var.vm_size
   zone = "us-central1-a"
   #count = var.num_instances

   #To allow update machine type
   allow_stopping_for_update = true 
   
   boot_disk {
     source = google_compute_disk.boot-disk.name
   }

  network_interface {
     network = "default"
     access_config {}
  }
}
