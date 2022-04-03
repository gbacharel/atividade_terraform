resource "azurerm_storage_account" "sa-atividadeform" {
    name                        = "saatividadeterraform"
    resource_group_name         = azurerm_resource_group.rg-atividadeterra.name
    location                    = azurerm_resource_group.rg-atividadeterra.location
    account_tier                = "Standard"
    account_replication_type    = "LRS"
}

resource "azurerm_linux_virtual_machine" "vm-atividade" {
  name                  = "vm"
  location              = azurerm_resource_group.rg-atividadeterra.location
  resource_group_name   = azurerm_resource_group.rg-atividadeterra.name
  size                  = "Standard_F2"
  #admin_username = "adminuser"
  #admin_password = "Password1234!"
  #disable_password_authentication = false
  network_interface_ids = [azurerm_network_interface.nic-atividadeform.id]
 
 

source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "Latest"
  }


  admin_username = "adminuser"
  admin_password = "Password1234!"
  disable_password_authentication = false

  os_disk {
    #name              = "mydisk"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"

  }

    boot_diagnostics {
    storage_account_uri = azurerm_storage_account.sa-atividadeform.primary_blob_endpoint 
  }

}
