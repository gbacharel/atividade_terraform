resource "azurerm_linux_virtual_machine" "vm-atividadeform" {
  name                  = "vm-atividadeterraform"
  location              = azurerm_resource_group.rg-atividadeterra.location
  resource_group_name   = azurerm_resource_group.rg-atividadeterra.name
  size                  = "Standard_E2bs_v5"
  network_interface_ids = [azurerm_network_interface.nic-atividadeform.id]
 
 

source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "Latest"
  }


  admin_username = var.user
  admin_password = var.password
  disable_password_authentication = false

  os_disk {
    name              = "mydisk"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"

  }

    boot_diagnostics {
    storage_account_uri = azurerm_storage_account.sa-atividadeform.primary_blob_endpoint 
  }

}

