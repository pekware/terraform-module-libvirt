resource "libvirt_pool" "images" {
  name = var.pool_name
  type = "dir"
  path = "/var/lib/libvirt/images/${var.pool_name}"
}

resource "libvirt_volume" "cloud-image" {
  for_each = {
    for index, image in var.images :
    image.name => image
  }

  name   = each.value.name
  pool   = libvirt_pool.images.name
  source = each.value.source
  format = "qcow2"
}

resource "libvirt_network" "bridges" {
  for_each = {
    for index, bridge in var.bridges :
    bridge.name => bridge
  }

  name      = each.value.name
  mode      = "bridge"
  bridge    = each.value.bridge
  autostart = true
}
