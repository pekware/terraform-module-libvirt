variable "libvirt_uri" {
  type    = string
  default = "qemu:///system"
}

variable "project_name" {
  type    = string
  default = "terravirt"
}

variable "ssh_pubkey" {
  type = string
}
