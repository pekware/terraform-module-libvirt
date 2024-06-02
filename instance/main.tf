resource "libvirt_volume" "base-os" {
  name           = "${var.hostname}.base-os.qcow2"
  pool           = var.pool
  base_volume_id = var.base_volume_id
  size           = var.base_volume_size
}

resource "libvirt_cloudinit_disk" "commoninit" {
  name           = "${var.hostname}-commoninit.iso"
  user_data      = var.user_data
  network_config = var.network_config
  meta_data      = var.meta_data
  pool           = var.pool
}
