terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  zone = "ru-central1-d"
}

# get network subnets information
module "subnet-info" {
  source = "./modules/subnet-info"
  cloud_id = var.vpc_id
}

# create vm by Zone
module "subnet-info" {
  source = "./modules/create-vm"
  cloud_id = var.vpc_id
  cloud_zone = var.zone	
}


