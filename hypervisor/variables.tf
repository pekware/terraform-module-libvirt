variable "pool_name" {
  type = string
}

variable "bridges" {
  type = map(any)
}

variable "images" {
  type = list(any)
}
