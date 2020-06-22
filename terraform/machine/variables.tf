variable "prefix" {
  type = string
}

variable "instance_count" {
  type = string
}

variable "resource_pool_id" {
  type = string
}

variable "folder" {
  type = string
}

variable "datastore" {
  type = string
}

variable "datacenter_id" {
  type = string
}

variable "memory" {
  type = number
}

variable "cpu" {
  type = number
}

variable "ip" {
  type = string
}

variable "guest_id" {
  type = string
}

variable "common_prefix" {
  type = string
}

variable "iso_path" {
  type = string
}

variable "disks" {
  type = list(number)
}

variable "network" {
  type = string
}
