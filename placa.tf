#placa de rede 
resource "azurerm_network_interface" "nic-atividadeform" {
  name                = "nic-atividadeterraform"
  location            = azurerm_resource_group.rg-atividadeterra.location
  resource_group_name = azurerm_resource_group.rg-atividadeterra.name

  ip_configuration {
    name                            = "ip-atividadeterraform-nic"
    subnet_id                       = azurerm_subnet.sub-atividadeform.id
    private_ip_address_allocation   = "Dynamic"
    public_ip_address_id            = azurerm_public_ip.ip-atividadeform.id
  }
}

#ligação com o firewall 
resource "azurerm_network_interface_security_group_association" "nic-nsg-atividadeform" {
  network_interface_id      = azurerm_network_interface.nic-atividadeform.id
  network_security_group_id = azurerm_network_security_group.nsg-atividadeform.id
}