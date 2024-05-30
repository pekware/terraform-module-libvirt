output "pool_name" {
  value = libvirt_pool.images.name
}

output "images" {
  value = zipmap(
    values(libvirt_volume.cloud-image)[*].name,
    values(libvirt_volume.cloud-image)[*].id
  )
}
