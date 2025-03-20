resource "yandex_compute_disk" "boot-disk-1" {
  name     = "boot-disk-1"
  type     = "network-hdd"
  zone     = var.cloud_zone
  size     = var.disk_size
  image_id = var.image_id1
}

resource "yandex_compute_instance" "vm-pub" {
  name = "terraform1"
  platform_id = "standard-v3"
  
  resources {
    cores  = var.cores
    memory = var.memory
  }

  boot_disk {
    disk_id = yandex_compute_disk.boot-disk-1.id
  }

  network_interface {
    subnet_id = var.subnet_id
  }
}