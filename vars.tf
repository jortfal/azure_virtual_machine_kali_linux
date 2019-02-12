##################################################################################
#####                               Global Variables                         #####
##################################################################################

variable "resource_group_name" {
    description = ""
    type        = "string"
}

variable "virtual_network_resource_group_name" {
    description = ""
    type        = "string"
}

variable "virtual_network_name" {
    description = ""
    type        = "string"
}

variable "subnet_name" {
    description = ""
    type        = "string"
}

##################################################################################
#####                               Module Variables                          ####
##################################################################################

variable "instance_count" {
    description = ""
    type        = "string"
}

# Network 

variable "pi_name" {
    description = ""
    type        = "string"
}

variable "pi_allocation_method" {
    description = ""
    type        = "string"
    default     = "Dynamic"
}
variable "nic_name" {
    description = ""
    type        = "string"
}

variable "nic_ip_configuration_name" {
    description = ""
    type        = "string"
}

variable "nic_ip_configuration_private_ip_address_allocation" {
    description = ""
    type        = "string"
    default     = "Dynamic"
}

# variable "nic_ip_configuration_private_ip_address" {
#     description = ""
#     type        = "map"
# }

# Virtual Machine
variable "vm_name" {
    description = ""
    type        = "string"
}

variable "vm_size" {
    description = ""
    type        = "string"
}

variable "vm_delete_os_disk_on_termination" {
    description = ""
    default     = false
}

variable "vm_delete_data_disks_on_termination" {
    description = ""
    default     = false
}

variable "vm_storage_image_publisher" {
    description = ""
    type        = "string"
}
variable "vm_storage_image_offer" {
    description = ""
    type        = "string"
}
variable "vm_storage_image_sku" {
    description = ""
    type        = "string"
}
variable "vm_storage_image_version" {
    description = ""
    type        = "string"
}

variable "plan_name" {
    description = ""
    type        = "string"
}

variable "plan_product" {
    description = ""
    type        = "string"
}

variable "vm_storage_os_disk_name" {
    description = ""
    type        = "string"
}
variable "vm_storage_os_disk_caching" {
    description = ""
    type        = "string"
    default     = "ReadWrite"
}
variable "vm_storage_os_disk_create_option" {
    description = ""
    type        = "string"
}
variable "vm_storage_os_disk_managed_disk_type" {
    description = ""
    type        = "string"
}
variable "vm_os_profile_os_profile_computer_name" {
    description = ""
    type        = "string"
}
variable "vm_os_profile_admin_username" {
    description = ""
    type        = "string"
}
variable "vm_os_profile_admin_password" {
    description = ""
    type        = "string"
}
variable "vm_os_config_disable_password_authentication" {
    description = ""
    default     = true
}

################################################################################################
########                                  Tags Variables                                ########
################################################################################################

variable "tag_environment" {
    description = ""
    type        = "string"
    default     = "null"
}

variable "tag_resource" {
    description = ""
    type        = "string"
    default     = "kali-linux"
}

variable "tag_owner" {
    description = ""
    type        = "string"
    default     = "null"
}
