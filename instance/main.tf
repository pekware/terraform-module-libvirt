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

resource "libvirt_domain" "domain-ubuntu" {
  name   = var.hostname
  memory = var.memory
  vcpu   = var.vcpu

  cloudinit = libvirt_cloudinit_disk.commoninit.id

  dynamic "network_interface" {
    for_each = var.networks

    content {
      network_name = network_interface.value.network_name
    }
  }

  disk {
    volume_id = libvirt_volume.base-os.id
  }

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  console {
    type        = "pty"
    target_type = "virtio"
    target_port = "1"
  }

  graphics {
    type        = "spice"
    listen_type = "address"
    autoport    = true
  }
}
