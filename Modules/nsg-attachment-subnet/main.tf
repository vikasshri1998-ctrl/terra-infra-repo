resource "azurerm_subnet_network_security_group_association" "subnet_nsg" {
    for_each = var.attachment
  subnet_id                 = data.azurerm_subnet.subnet[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsg[each.key].id
}