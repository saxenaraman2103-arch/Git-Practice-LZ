network_nics = {
  nic1 = {
    nic_name                = "frontend-vm-nic"
    nic_location            = "westus"
    nic_resource_group_name = "raman-rg"
    nic_subnet_name         = "frontend-subnet"
    nic_virtual_network     = "raman-network"
    nic_public_ip_name      = "frontend-vm-public-ip"
  }

  nic2 = {
    nic_name                = "backend-vm-nic"
    nic_location            = "westus"
    nic_resource_group_name = "raman-rg"
    nic_subnet_name         = "backend-subnet"
    nic_virtual_network     = "raman-network"
    nic_public_ip_name      = "backend-vm-public-ip"

  }
}
vms = {
  vm1 = {
    nic_name                     = "backend-vm-nic"
    nic_location                 = "westus"
    nic_resource_group_name      = "raman-rg"
    nic_subnet_name              = "backend-subnet"
    nic_virtual_network          = "raman-network"
    nic_public_ip_name           = "backend-vm-public-ip"
    vm_name                      = "backend-vm"
    vm_size                      = "Standard_D4_v5"
    admin_username               = "adminuser"
    admin_password               = "raman@123"
    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"
    source_image_publisher       = "canonical"
    source_image_offer           = "0001-com-ubuntu-server-jammy"
    source_image_sku             = "22_04-lts"
    source_image_version         = "latest"
  }

  vm2 = {
    nic_name                     = "frontend-vm-nic"
    nic_location                 = "westus"
    nic_resource_group_name      = "raman-rg"
    nic_subnet_name              = "frontend-subnet"
    nic_virtual_network          = "raman-network"
    nic_public_ip_name           = "frontend-vm-public-ip"
    vm_name                      = "frontend-vm"
    vm_size                      = "Standard_D4_v5"
    admin_username               = "adminuser"
    admin_password               = "raman@123"
    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"
    source_image_publisher       = "canonical"
    source_image_offer           = "0001-com-ubuntu-server-jammy"
    source_image_sku             = "22_04-lts"
    source_image_version         = "latest"
  }
}
