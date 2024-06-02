variable "hostname" {
  type = string
}

variable "pool" {
  type = string
}

variable "base_volume_id" {
  type = string
}

variable "base_volume_size" {
  type        = number
  description = "Size of base OS volume in bytes."
}

variable "user_data" {
  type    = string
  default = ""
}

variable "network_config" {
  type    = string
  default = ""
}

variable "meta_data" {
  type    = string
  default = ""
}
