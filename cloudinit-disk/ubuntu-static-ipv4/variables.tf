variable "username" {
  type = string
}

variable "ssh_pubkeys" {
  type = list(any)
}

variable "nic_name" {
  type = string
}

variable "ipv4" {
  type = string
}

variable "cidr" {
  type = string
}

variable "gateway4" {
  type = string
}

variable "nameservers" {
  type = list(string)
}
