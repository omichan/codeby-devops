terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
  zone = "ru-central1-d"
}

import {
  to = yandex_compute_instance.default
  id = "fv4vvoolh41fs41ii61c"
}