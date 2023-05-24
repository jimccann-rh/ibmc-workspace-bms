variable "name" {}
variable "datacenter" {}
variable "public_vlan" {}
variable "public_subnet" {}
variable "private_vlan" {}
variable "private_subnet" {}
variable "tags" {}
variable "domain_name" {}
variable "network_speed" {
  description = "The network speed for the node instance."
  type        = number
  default     = 25000
  #default     = 10000
}
