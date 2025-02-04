provider "azurerm" {
    features {}
}

resource "azurerm_resource_group" "example" {
    name     = "DevOps-RG"
    location = "westeurope" 
}

resource "azurerm_virtual_machine" "example" {
    name                = "example-vm"
    resource_group_name = azurerm_resource_group.example.name
    location            = azurerm_resource_group.example.location
    vm_size             = "Standard_B1s"

    storage_os_disk {
        name              = "example-os-disk"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Standard_LRS"
    }

    network_interface_ids = [
        azurerm_network_interface.example.id
    ]
}