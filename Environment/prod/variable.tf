variable "rgn" {
  type = map(object({
    rg_name    = string
    location   = string
    managed_by = optional(string)
    tags       = optional(map(string))
  }))
}
variable "vnetn" {
  type = map(object({
    vnet_name     = string
    address_space = list(string)
    rg_name       = string
    bgp_community = optional(string)
    ddos_protection_plan = optional(map(object({
      id     = string
      enable = bool
    })))
    encryption = optional(map(object({
      enforcement = string
    })))
    dns_servers             = optional(list(string))
    edge_zone               = optional(string)
    flow_timeout_in_minutes = optional(number)
    ip_address_pool = optional(map(object({
      id                     = string
      number_of_ip_addresses = number
    })))
    subnet = optional(map(object({
      subnet_name      = string
      address_prefixes = list(string)
      security_group   = optional(string)
      delegation = optional(map(object({
        delegation_name = string
        service_delegation = optional(map(object({
          service_delegation_name = string
          actions                 = optional(list(string))
        })))
      })))
    })))

  }))
}

variable "nsg" {
  type = map(object({
    nsg_name      = string
    rg_name       = string
    tags          = optional(map(string))
    security_rule = optional(map(object({
             security_name = string
            priority = number
            direction = string
            protocol = string
            source_port_range = optional(string)
            source_port_ranges = optional(list(string))
            destination_port_range = optional(string)
            destination_port_ranges = optional(list(string))
            source_address_prefix = optional(string)
            source_address_prefixes = optional(list(string))
            source_application_security_group_ids = optional(list(string))
            destination_address_prefix = optional(string)
            destination_address_prefixes = optional(list(string))
            destination_application_security_group_ids = optional(list(string))
            access = string


    })))
  }))
}
variable "nic" {
  type = map(object({
    nic_name    = string
    rg_name     = string
    subnet_name = string
    vnet_name   = string
    pip_name    = optional(string)
    ip_configuration = object({
      ip_configuration_name                              = string
      private_ip_address_allocation                      = string
      subnet_id                                          = optional(string)
      gateway_load_balancer_frontend_ip_configuration_id = optional(string)
      private_ip_address_version                         = optional(string)
      public_ip_address_id                               = optional(string)
      primary                                            = optional(bool)
    })
    auxiliary_mode                 = optional(string)
    auxiliary_sku                  = optional(string)
    dns_servers                    = optional(list(string))
    edge_zone                      = optional(string)
    ip_forwarding_enabled          = optional(bool)
    accelerated_networking_enabled = optional(bool)
    internal_dns_name_label        = optional(string)
    tags                           = optional(map(string))
  }))

}
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
variable "pip" {
  type = map(object({
    pip_name                = string
    rg_name                 = string
    allocation_method       = string
    zones                   = optional(list(string))
    ddos_protection_mode    = optional(string)
    ddos_protection_plan_id = optional(string)
    domain_name_label       = optional(string)
    domain_name_label_scope = optional(string)
    edge_zone               = optional(string)
    idle_timeout_in_minutes = optional(number)
    ip_version              = optional(string)
    ip_tags                 = optional(map(string))
    public_ip_prefix_id     = optional(string)
    reverse_fqdn            = optional(string)
    sku                     = optional(string)
    sku_tier                = optional(string)
    tags                    = optional(map(string))

  }))
}
variable "db" {
  type = map(object({
    db_name                     = string
    server_name                 = string
    rg_name                     = string
    auto_pause_delay_in_minutes = optional(number)
    create_mode                 = optional(string)
    import = optional(object({
      storage_uri                  = string
      storage_key                  = string
      storage_key_type             = string
      administrator_login          = string
      administrator_login_password = string
      authentication_type          = string
      storage_account_id           = optional(string)
    }))
    creation_source_database_id = optional(string)
    collation                   = optional(string)
    elastic_pool_id             = optional(string)
    enclave_type                = optional(string)
    geo_backup_enabled          = optional(bool)
    ledger_enabled              = optional(bool)
    license_type                = optional(string)
    long_term_retention_policy = optional(object({
      weekly_retention          = optional(string)
      monthly_retention         = optional(string)
      yearly_retention          = optional(string)
      week_of_year              = optional(number)
      immutable_backups_enabled = optional(bool)
    }))
    max_size_gb                 = optional(number)
    min_capacity                = optional(number)
    restore_point_in_time       = optional(string)
    recover_database_id         = optional(string)
    recovery_point_id           = optional(string)
    restore_dropped_database_id = optional(string)
  }))
}




variable "server" {
    type = map(object({
        server_name = string
        rg_name = string
        version = string
        vault_name = string
        secret_name  = string
        admin_login = string
        rgs_name = string

        # display_name = string
        # administrator_login = optional(string)
        # administrator_login_password_wo = optional(string)
        # administrator_login_password = optional(string)
        # administrator_login_password_wo_version = optional(string)
        # azuread_administrator = optional(object({
        #     login_username = string
        #     object_id = optional(string)
        #     tenant_id = optional(string)
        #     azuread_authentication_only = optional(bool)
        # }))
        # connection_policy = optional(string)
        # express_vulnerability_assessment_enabled = optional(bool)
        # identity = optional(object({
        #     type = string
        #     identity_ids = optional(list(string))
        # }))
        # transparent_data_encryption_key_vault_key_id = optional(string)
        # minimum_tls_version = optional(string)
        # public_network_access_enabled = optional(bool)
        # outbound_network_restriction_enabled = optional(bool)
        # primary_user_assigned_identity_id = optional(string)
        # tags = optional(map(string))
    }))
}
variable "attachment" {
  type = map(object({
    subnet_name = string
    vnet_name = string
    rg_name = string
    nsg_name = string
  }))
}