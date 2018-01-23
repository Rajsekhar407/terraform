# create a resource group 
resource "azurerm_resource_group" "samplegroup" {
    name = "samplegroup"
    location = "West US"
}

# create a virtual network
resource "azurerm_virtual_network" "network" {
    name = "samplegroupnetwork"
    address_space = ["10.0.0.0/16"]
    location = "West US"
    resource_group_name = "${azurerm_resource_group.samplegroup.name}"

# create subnet
resource "azurerm_subnet" "samplegroupsubnet1" {
    name = "subnet1"
    resource_group_name = "${azurerm_resource_group.samplegroup.name}"
    virtual_network_name = "${azurerm_virtual_network.samplegroupnetwork.name}"
    address_prefix = "10.0.2.0/24"
  }
}

