terraform {
  # https://github.com/hashicorp/terraform/releases
  required_version = ">= 0.13"
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = ">= 0.6.2, < 1.0"
    }
  }
}
