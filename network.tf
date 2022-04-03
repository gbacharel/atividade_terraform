
#rede
resource "azurerm_virtual_network" "vnet-atividadeform" {
  name                = "vnet-atividadeterraform"
  location            = azurerm_resource_group.rg-atividadeterra.location
  resource_group_name = azurerm_resource_group.rg-atividadeterra.name
  address_space       = ["10.0.0.0/16"]

  tags = {
    nome = "Bacharel" 
  }
}
#sub rede
resource "azurerm_subnet" "sub-atividadeform" {
  name                 = "sub-atividadeterraform"
  resource_group_name  = azurerm_resource_group.rg-atividadeterra.name
  virtual_network_name = azurerm_virtual_network.vnet-atividadeform.name
  address_prefixes     = ["10.0.1.0/24"]
}

#ip 
resource "azurerm_public_ip" "ip-atividadeform" {
  name                = "ip-atividadeterraform"
  resource_group_name = azurerm_resource_group.rg-atividadeterra.name
  location            = azurerm_resource_group.rg-atividadeterra.location
  allocation_method   = "Static"

}