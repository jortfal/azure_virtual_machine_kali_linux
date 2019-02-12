data "azurerm_subnet" "subnet" {
  name                 = "${var.subnet_name}"
  virtual_network_name = "${var.virtual_network_name}"
  resource_group_name  = "${var.virtual_network_resource_group_name}" 
}
