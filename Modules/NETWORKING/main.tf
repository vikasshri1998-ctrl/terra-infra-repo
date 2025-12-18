resource "azurerm_virtual_network" "vnet" {
    for_each = var.vnetn
    name  = each.value.vnet_name
    address_space = each.value.address_space
    resource_group_name = data.azurerm_resource_group.rg[each.key].name
    location = data.azurerm_resource_group.rg[each.key].location
    bgp_community = each.value.bgp_community
    dynamic "ddos_protection_plan" {
        for_each = each.value.ddos_protection_plan != null ? each.value.ddos_protection_plan : {}
       content {
        id = ddos_protection_plan.value.id
        enable = ddos_protection_plan.value.enable
    }
       }
    dynamic "encryption" {
        for_each = each.value.encryption != null ? each.value.encryption : {}
        content {
            enforcement = encryption.value.enforcement
        }

    }
    dns_servers = lookup(each.value, "dns_servers", [])
    edge_zone = lookup(each.value, "edge_zone", null)
    flow_timeout_in_minutes = lookup(each.value, "flow_timeout_in_minutes", null)
    dynamic "ip_address_pool" {
        for_each = each.value.ip_address_pool != null ? each.value.ip_address_pool : {}
        content {
            id = ip_address_pool.value.id
            number_of_ip_addresses = ip_address_pool.value.number_of_ip_addresses
        }
    }
    dynamic "subnet" {
        for_each = each.value.subnet != null ? each.value.subnet : {}
        content {
            name = subnet.value.subnet_name
            address_prefixes = subnet.value.address_prefixes
            security_group = lookup(subnet.value, "security_group", null)
            default_outbound_access_enabled = lookup(each.value, "default_access_enabled", null)
            dynamic "delegation" {
                for_each = subnet.value.delegation != null ? subnet.value.delegation : {}
                content {
                    name = delegation.value.delegation_name
                    dynamic "service_delegation" {
                        for_each = delegation.value.service_delegation != null ? delegation.value.service_delegation : {}
                        content {
                            name = service_delegation.value.service_delegation_name
                            actions = lookup(service_delegation.value, actions, [])
                        }
                    }
                }
            } 

        }
    }

    
}