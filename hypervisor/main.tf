resource "libvirt_pool" "images" {
  name = var.pool_name
  type = "dir"
  path = "/var/lib/libvirt/images/${var.pool_name}"
}

resource "libvirt_network" "bridges" {
  for_each = var.bridges

  name      = each.value.name
  mode      = "bridge"
  bridge    = each.value.bridge
  autostart = true
}
