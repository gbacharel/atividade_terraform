resource "azurerm_storage_account" "sa-atividadeform" {
    name                        = "saatividadeterraform"
    resource_group_name         = azurerm_resource_group.rg-atividadeterra.name
    location                    = azurerm_resource_group.rg-atividadeterra.location
    account_tier                = "Standard"
    account_replication_type    = "LRS"
}
