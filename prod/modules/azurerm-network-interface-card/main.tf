data "azurerm_subnet" "subnet" {
  for_each             = var.network_nics
  name                 = each.value.nic_subnet_name
  virtual_network_name = each.value.nic_virtual_network
  resource_group_name  = each.value.nic_resource_group_name
}

data "azurerm_public_ip" "public-ip" {
  for_each            = var.network_nics
  name                = each.value.nic_public_ip_name
  resource_group_name = each.value.nic_resource_group_name
}

resource "azurerm_network_interface" "network_nic" {
  for_each            = var.network_nics
  name                = each.value.nic_name
  location            = each.value.nic_location
  resource_group_name = each.value.nic_resource_group_name

  ip_configuration {
    name                          = "raman-internal"
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    public_ip_address_id          = data.azurerm_public_ip.public-ip[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_linux_virtual_machine" "virtual_machine" {
  for_each                        = var.vms
  name                            = each.value.vm_name
  resource_group_name             = each.value.nic_resource_group_name
  location                        = each.value.nic_location
  size                            = each.value.vm_size
  admin_username                  = each.value.admin_username
  admin_password                  = each.value.admin_password
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.network_nic[each.value.nic_key].id
  ]

  os_disk {
    caching              = each.value.os_disk_caching
    storage_account_type = each.value.os_disk_storage_account_type
  }

  source_image_reference {
    publisher = each.value.source_image_publisher
    offer     = each.value.source_image_offer
    sku       = each.value.source_image_sku
    version   = each.value.source_image_version
  }
}



