resource "azurerm_virtual_machine" "vm" {
  for_each              = var.vms
  name                  = each.value.vm_name
  resource_group_name   = data.azurerm_resource_group.rg[each.key].name
  location              = data.azurerm_resource_group.rg[each.key].location
  network_interface_ids = [data.azurerm_network_interface.nic[each.key].id]
  vm_size               = each.value.vm_size

  
  # dynamic "os_profile_windows_config" {
  #   for_each = each.value.os_profile_windows_config != null ? each.value.os_profile_windows_config : {}
  #   content {
  #     provision_vm_agent        = lookup(os_profile_windows_config.value, "provision_vm_agent", null)
  #     enable_automatic_upgrades = lookup(os_profile_windows_config.value, "enable_automatic_upgrades", null)
  #     timezone                  = lookup(os_profile_windows_config.value, "timezone", null)

  #   }
  # }
  availability_set_id = lookup(each.value, "availability_set_id", null)
  storage_image_reference {
    publisher = each.value.storage_image_reference.publisher
    offer     = each.value.storage_image_reference.offer
    sku       = each.value.storage_image_reference.sku
    version   = each.value.storage_image_reference.version
  }
  storage_os_disk {
    name              = each.value.storage_os_disk.disk_name
    caching           = each.value.storage_os_disk.caching
    create_option     = each.value.storage_os_disk.create_option
    managed_disk_type = each.value.storage_os_disk.managed_disk_type
  }
  os_profile {
    computer_name  = each.value.os_profile.computer_name
    admin_username = each.value.os_profile.admin_username
    admin_password = data.azurerm_key_vault_secret.vm_secret[each.key].value
  }
    os_profile_linux_config {
    
   
        disable_password_authentication = each.value.os_profile_linux_config.disable_password_authentication
    
    
  }
}
