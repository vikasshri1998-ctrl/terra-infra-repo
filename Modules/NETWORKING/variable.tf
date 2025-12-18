variable "vnetn" {
    type = map(object({
        vnet_name = string
        address_space = list(string)
        rg_name = string
        bgp_community = optional(string)
        ddos_protection_plan = optional(map(object({
            id = string
            enable = bool
        })))
        encryption = optional(map(object({
            enforcement = string
        })))
        dns_servers = optional(list(string))
        edge_zone = optional(string)
        flow_timeout_in_minutes = optional(number)
        ip_address_pool = optional(map(object({
            id = string
            number_of_ip_addresses = number
        })))
        subnet = optional(map(object({
            subnet_name = string
            address_prefixes = list(string)
            security_group = optional(string)
            delegation = optional(map(object({
                delegation_name = string
                service_delegation = optional(map(object({
                    service_delegation_name = string
                    actions = optional(list(string))
                })))
            })))
        })))

    }))
}