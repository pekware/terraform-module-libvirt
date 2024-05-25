resource "libvirt_pool" "images" {
  name = var.pool_name
  type = "dir"
  path = "/var/lib/libvirt/images/${var.pool_name}"
}

resource "libvirt_volume" "cloud-image" {
  for_each = var.images

  name   = each.value.name
  pool   = libvirt_pool.images.name
  source = each.value.source
  format = "qcow2"
}

resource "libvirt_network" "bridges" {
  for_each = var.bridges

  name      = each.value.name
  mode      = "bridge"
  bridge    = each.value.bridge
  autostart = true
}
