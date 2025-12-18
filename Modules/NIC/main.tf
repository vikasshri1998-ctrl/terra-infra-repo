resource "azurerm_network_interface" "nic" {
    for_each = var.nic
    name = each.value.nic_name
    resource_group_name = data.azurerm_resource_group.rg[each.key].name
    location = data.azurerm_resource_group.rg[each.key].location
    ip_configuration {
        name = each.value.ip_configuration.ip_configuration_name
        private_ip_address_allocation = each.value.ip_configuration.private_ip_address_allocation
        subnet_id = data.azurerm_subnet.subnet[each.key].id
        gateway_load_balancer_frontend_ip_configuration_id = lookup(each.value.ip_configuration, "gateway_load_balancer_frontend_ip_configuration_id", null)
        private_ip_address_version = lookup(each.value.ip_configuration, "private_ip_address_version", null)
        public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
        primary = lookup(each.value.ip_configuration, "primary", null)
        

    }
    auxiliary_mode = lookup(each.value, "auxiliary_mode", null)
    auxiliary_sku = lookup(each.value, "auxiliary_sku", null)
    dns_servers = lookup(each.value, "dns_servers", [])
    edge_zone = lookup(each.value, "edge_zone", null)
    ip_forwarding_enabled = lookup(each.value, "ip_forwarding_enabled", null)
    accelerated_networking_enabled = lookup(each.value, "accelerated_networking_enabled", null)
    internal_dns_name_label = lookup(each.value, "internal_dns_name_label", null)
    tags = lookup(each.value, "tags", {})
}