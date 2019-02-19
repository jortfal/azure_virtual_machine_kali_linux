resource "azurerm_public_ip" "pi" {
  count                   = "${var.instance_count}"
  name                    = "${var.pi_name}${count.index + 1}"
  location                = "${data.azurerm_resource_group.resource_group.location}"
  resource_group_name     = "${data.azurerm_resource_group.resource_group.name}"
  allocation_method       = "${var.pi_allocation_method}"

  tags {
    environment = "${var.tag_environment}"
    resource    = "${var.tag_resource}"
    owner       = "${var.tag_owner}"
  }
}

resource "azurerm_network_interface" "nic" {
  count                 = "${var.instance_count}"
  name                  = "${var.nic_name}${count.index + 1}"
  location              = "${data.azurerm_resource_group.resource_group.location}"
  resource_group_name   = "${data.azurerm_resource_group.resource_group.name}"

  ip_configuration {
    name                          = "${var.nic_ip_configuration_name}${count.index + 1}"
    subnet_id                     = "${data.azurerm_subnet.subnet.id}"
    private_ip_address_allocation = "${var.nic_ip_configuration_private_ip_address_allocation}"
    # private_ip_address            = "${lookup(var.nic_mgmt_ip_configuration_private_ip_address, count.index)}"
    public_ip_address_id          = "${element(azurerm_public_ip.pi.*.id, count.index)}"
  }

  tags {
    environment = "${var.tag_environment}"
    resource    = "${var.tag_resource}"
    owner       = "${var.tag_owner}"
  }

  depends_on = ["azurerm_public_ip.pi"]
}
