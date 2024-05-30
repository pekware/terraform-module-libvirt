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
