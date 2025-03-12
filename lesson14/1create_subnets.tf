resource "yandex_vpc_network" "cdb-net1" {
  name        = var.network
  description = "My first network"
}

resource "yandex_vpc_subnet" "subnet-pub" {
  name           = var.subnet1
  zone           = var.zone
  network_id     = "${yandex_vpc_network.cdb-net1.id}"
  v4_cidr_blocks = var.subnet1_v4_cidr_blocks
}

resource "yandex_vpc_subnet" "subnet-priv" {
  name           = var.subnet2
  zone           = var.zone
  network_id     = "${yandex_vpc_network.cdb-net1.id}"
  v4_cidr_blocks = var.subnet2_v4_cidr_blocks
}

resource "yandex_vpc_security_group" "sg1" {
  name        = "def-sg1"
  description = "description for my security group"
  network_id  = "${yandex_vpc_network.cdb-net1.id}"

  labels = {
    my-label = "my-label-value"
  }
}

resource "yandex_vpc_security_group_rule" "rule1" {
  security_group_binding = yandex_vpc_security_group.sg1.id
  direction              = "ingress"
  description            = "rule1 description"
  v4_cidr_blocks         = "${yandex_vpc_subnet.subnet-pub.v4_cidr_blocks}"
  port                   = 22
  protocol               = "TCP"
}

resource "yandex_vpc_security_group_rule" "rule2" {
  security_group_binding = yandex_vpc_security_group.sg1.id
  direction              = "egress"
  description            = "rule2 description"
  v4_cidr_blocks         = "${yandex_vpc_subnet.subnet-pub.v4_cidr_blocks}"
  port                   = 443
  protocol               = "TCP"
}

resource "yandex_vpc_security_group_rule" "rule3" {
  security_group_binding = yandex_vpc_security_group.sg1.id
  direction              = "ingress"
  description            = "rule3 description"
  v4_cidr_blocks         = "${yandex_vpc_subnet.subnet-priv.v4_cidr_blocks}"
  port                   = 22
  protocol               = "TCP"
}

resource "yandex_vpc_security_group_rule" "rule4" {
  security_group_binding = yandex_vpc_security_group.sg1.id
  direction              = "egress"
  description            = "rule4 description"
  v4_cidr_blocks         = "${yandex_vpc_subnet.subnet-priv.v4_cidr_blocks}"
  port                   = 8080
  protocol               = "TCP"
}

resource "yandex_vpc_security_group_rule" "rule5" {
  security_group_binding = yandex_vpc_security_group.sg1.id
  direction              = "ingress"
  description            = "rule5 description"
  v4_cidr_blocks         = "${yandex_vpc_subnet.subnet-pub.v4_cidr_blocks}"
  port                   = 80
  protocol               = "TCP"
}