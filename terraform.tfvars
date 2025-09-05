location            = "eastus"
resource_group_name = "rg-terraform-vm"
vm_name             = "tf-vm-01"
admin_username      = "azureuser"
# admin_ssh_key = "ssh-rsa AAAA... user@host" # set as pipeline variable VM_ADMIN_SSH_PUB
vm_size = "Standard_B1s"
