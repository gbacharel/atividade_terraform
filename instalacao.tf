# ip para set no null 
data "azurerm_public_ip" "ip-atividadeformvar"{
    name = azurerm_public_ip.ip-atividadeform.name
    resource_group_name = azurerm_resource_group.rg-atividadeterra.name
}

resource "null_resource" "install-webserver" {
  connection {
    type = "ssh"
    host = data.azurerm_public_ip.ip-atividadeformvar.ip_address
    user = var.user
    password = var.password
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install -y apache2",
    ]
  }
    depends_on = [
    azurerm_linux_virtual_machine.vm-atividadeform
  ]
} 

resource "null_resource" "upload-app" {
  connection {
    type = "ssh"
    host = data.azurerm_public_ip.ip-atividadeformvar.ip_address
    user = var.user
    password = var.password
  }

  provisioner "file" {
    source = "app"
    destination = "/home/adminuser"
  }

  depends_on = [
    azurerm_linux_virtual_machine.vm-atividadeform
  ]
}

variable user {}
variable password {}

