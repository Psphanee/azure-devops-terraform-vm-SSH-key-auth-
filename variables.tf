variable "location" {
  type    = string
  default = "eastus"
}


variable "resource_group_name" {
  type    = string
  default = "rg-terraform-vm"
}


variable "vm_name" {
  type    = string
  default = "tf-vm-01"
}


variable "admin_username" {
  type    = string
  default = "azureuser"
}


variable "admin_ssh_key" {
  type        = string
  description = "Public SSH key string for VM admin (e.g., contents of ~/.ssh/id_rsa.pub)."
}


variable "vm_size" {
  type    = string
  default = "Standard_B1s"
}
