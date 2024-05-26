terraform {
  required_providers {
    libvirt = {
      # https://github.com/dmacvicar/terraform-provider-libvirt/releases
      source  = "dmacvicar/libvirt"
      version = ">= 0.7, < 1.0"

      configuration_aliases = [libvirt]
    }
  }
}
