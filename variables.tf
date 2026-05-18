variable "name" {
  type = string
}

variable "description" {
  type    = string
  default = ""
}

variable "secret_values" {
  type      = map(string)
  sensitive = true
}

variable "tags" {
  type    = map(string)
  default = {}
}
