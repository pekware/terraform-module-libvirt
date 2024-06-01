variable "password" {
  type = string
}

data "template_file" "user_data" {
  template = templatefile("${path.module}/cloud_init.cfg", {
    password = var.password
  })
}

output "user_data" {
  value = data.template_file.user_data.rendered
}
