resource "azurerm_virtual_machine" "vm" {
  count                        = "${var.instance_count}"
  name                         = "${var.vm_name}${count.index + 1}"
  location                     = "${data.azurerm_resource_group.resource_group.location}"
  resource_group_name          = "${data.azurerm_resource_group.resource_group.name}"
  network_interface_ids        = ["${element(azurerm_network_interface.nic.*.id, count.index)}"]
  primary_network_interface_id = "${element(azurerm_network_interface.nic.*.id, count.index)}"
  vm_size                      = "${var.vm_size}"

  delete_os_disk_on_termination    = "${var.vm_delete_os_disk_on_termination}"
  delete_data_disks_on_termination = "${var.vm_delete_data_disks_on_termination}"

  storage_image_reference {
    publisher = "${var.vm_storage_image_publisher}"
    offer     = "${var.vm_storage_image_offer}"
    sku       = "${var.vm_storage_image_sku}"
    version   = "${var.vm_storage_image_version}"
  }
  storage_os_disk {
    name              = "${var.vm_storage_os_disk_name}${count.index + 1}"
    caching           = "${var.vm_storage_os_disk_caching}"
    create_option     = "${var.vm_storage_os_disk_create_option}"
    managed_disk_type = "${var.vm_storage_os_disk_managed_disk_type}"
  }
  os_profile {
    computer_name  = "${var.vm_os_profile_os_profile_computer_name}${count.index + 1}"
    admin_username = "${var.vm_os_profile_admin_username}"
    admin_password = "${var.vm_os_profile_admin_password}"
  }
  
  os_profile_linux_config {
    disable_password_authentication = "${var.vm_os_config_disable_password_authentication}"
  }
  
  depends_on = ["azurerm_network_interface.nic"]
}
