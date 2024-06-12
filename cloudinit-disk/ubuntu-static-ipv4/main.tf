data "template_file" "user_data" {
  template = templatefile("${path.module}/cloud_init.cfg", {
    username    = var.username
    ssh_pubkeys = var.ssh_pubkeys
  })
}

data "template_file" "network_config" {
  template = templatefile("${path.module}/network_config.cfg", {
    nic_name    = var.nic_name,
    ipv4        = var.ipv4,
    cidr        = var.cidr,
    gateway4    = var.gateway4,
    nameservers = var.nameservers
  })
}

output "user_data" {
  value = data.template_file.user_data.rendered
}

output "network_config" {
  value = data.template_file.network_config.rendered
}
