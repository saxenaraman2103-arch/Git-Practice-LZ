publicips = {
  pip1 = {
    name                = "frontend-public-ip"
    resource_group_name = "raman-rg"
    location            = "westus"
    allocation_method   = "Dynamic"

  }
  pip2 = {
    name                = "backend-public-ip"
    resource_group_name = "raman-rg"
    location            = "westus"
    allocation_method   = "Dynamic"
  }
}
