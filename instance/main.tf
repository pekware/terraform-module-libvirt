resource "libvirt_volume" "base-os" {
  name           = "${var.hostname}.base-os.qcow2"
  pool           = var.pool
  base_volume_id = var.base_volume_id
  size           = var.base_volume_size
}
