resource "libvirt_pool" "images" {
  name = var.pool_name
  type = "dir"
  path = "/var/lib/libvirt/images/${var.pool_name}"
}
