output "image_ids" {
  value = values(libvirt_volume.cloud-image)[*].id
}
