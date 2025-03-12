variable "zone" {
  type    = string
  default = "ru-central1-d"
}

variable "network" {
  type    = string
  default = "cdbnet1"
}

variable "subnet1" {
  type    = string
  default = "public"
}

variable "subnet2" {
  type    = string
  default = "private"
}

variable "subnet1_v4_cidr_blocks" {
  type    = list(string)
  default = ["192.168.10.0/24"]
}

variable "subnet2_v4_cidr_blocks" {
  type    = list(string)
  default = ["192.168.11.0/24"]
}

variable "nat" {
  type    = bool
  default = true
}

variable "image_id1" {
  type    = string
  default = "fd800c7s2p483i648ifv"
}

variable "name" {
  type    = string
}

variable "cores" {
  type    = number
  default = 2
}

variable "memory" {
  type    = number
  default = 2
}

variable "disk_size" {
  type    = number
  default = 10
}