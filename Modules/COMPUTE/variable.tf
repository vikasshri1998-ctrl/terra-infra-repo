variable "vms" {
  type = map(object({
    vm_name     = string
    rg_name     = string
    nic_name    = string
    secret_name = string
    vault_name  = string
    vm_size     = string
    rgs_name = string
    os_profile_linux_config = optional(object({
      disable_password_authentication = bool
    }))
    availability_set_id = optional(string)
    storage_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
    storage_os_disk = object({
      disk_name         = string
      caching           = string
      create_option     = string
      managed_disk_type = string
    })
    os_profile = object({
      computer_name  = string
      admin_username = string
    })
  }))
}
