variable "nic" {
    type = map(object({
        nic_name = string
        rg_name  = string
        subnet_name = string
        vnet_name = string
        pip_name = optional(string)
        ip_configuration = object({
            ip_configuration_name = string
            private_ip_address_allocation = string
            subnet_id = optional(string)
            gateway_load_balancer_frontend_ip_configuration_id = optional(string)
            private_ip_address_version = optional(string)
            public_ip_address_id = optional(string)
            primary = optional(bool)

        })
        auxiliary_mode = optional(string)
        auxiliary_sku = optional(string)
        dns_servers = optional(list(string))
        edge_zone = optional(string)
        ip_forwarding_enabled = optional(bool)
        accelerated_networking_enabled = optional(bool)
        internal_dns_name_label = optional(string)
        tags = optional(map(string))
    }))
}