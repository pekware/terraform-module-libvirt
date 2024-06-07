provider "libvirt" {
  alias = "hypervisor"
  uri   = var.libvirt_uri
}

module "hypervisor" {
  source = "../../hypervisor/"
  providers = {
    libvirt = libvirt.hypervisor
  }
  pool_name = var.project_name
  images    = local.images
  bridges   = local.bridges
}

module "cloudinit" {
  source      = "../../cloudinit-disk/user-data/default-user-with-ssh-pubkeys"
  username    = "ubuntu"
  ssh_pubkeys = local.ssh_pubkeys
}

module "ubuntu" {
  source = "../../instance/"
  providers = {
    libvirt = libvirt.hypervisor
  }
  hostname         = var.project_name
  memory           = "2048"
  vcpu             = 2
  pool             = module.hypervisor.pool_name
  base_volume_id   = module.hypervisor.images["ubuntu-24.04-minimal-cloudimg-amd64.img"]
  base_volume_size = 20 * 1024 * 1024 * 1024
  user_data        = module.cloudinit.user_data
  networks = [{
    network_name = var.project_name
  }]
}

locals {
  bridges = [
    {
      name   = var.project_name
      bridge = "virbr0"
    }
  ]

  ## note: name is used as the filename, which is appended to the pool directory
  images = [{
    name   = "ubuntu-24.04-minimal-cloudimg-amd64.img"
    source = "https://cloud-images.ubuntu.com/minimal/releases/noble/release/ubuntu-24.04-minimal-cloudimg-amd64.img"
  }]

  ssh_pubkeys = [var.ssh_pubkey]
}
