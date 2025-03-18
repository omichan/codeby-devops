data "yandex_vpc_network" "ext-net" {
  network_id = var.cloud_id
}

data "yandex_vpc_subnet" "ext-subnets" {
  for_each = toset(data.yandex_vpc_network.ext-net.subnet_ids)
  subnet_id = each.key
}

output "subnet-print" {
  value = [
    for sub in data.yandex_vpc_subnet.ext-subnets:
	    sub
  ]
}

output "subnet-info" {
  value = data.yandex_vpc_subnet.ext-subnets
}