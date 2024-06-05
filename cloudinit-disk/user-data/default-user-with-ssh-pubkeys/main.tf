variable "username" {
  type = string
}

variable "ssh_pubkeys" {
  type = list(any)
}

data "template_file" "user_data" {
  template = templatefile("${path.module}/cloud_init.cfg", {
    username    = var.username
    ssh_pubkeys = var.ssh_pubkeys
  })
}

output "user_data" {
  value = data.template_file.user_data.rendered
}
