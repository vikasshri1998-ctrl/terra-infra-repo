variable "db" {
    type = map(object({
        db_name                        = string
        server_name                    = string
        rg_name                        = string
        auto_pause_delay_in_minutes    = optional(number)
        create_mode                    = optional(string)
        import                         = optional(object({
            storage_uri                 = string
            storage_key                 = string
            storage_key_type            = string
            administrator_login         = string
            administrator_login_password= string
            authentication_type        = string
            storage_account_id          = optional(string)
        }))
        creation_source_database_id    = optional(string)
        collation                      = optional(string)
        elastic_pool_id                = optional(string)
        enclave_type                   = optional(string)
        geo_backup_enabled             = optional(bool)
        ledger_enabled                 = optional(bool)
        license_type                   = optional(string)
        long_term_retention_policy     = optional(object({
            weekly_retention           = optional(string)
            monthly_retention          = optional(string)
            yearly_retention           = optional(string)
            week_of_year               = optional(number)
            immutable_backups_enabled  = optional(bool)
        }))
        max_size_gb                    = optional(number)
        min_capacity                   = optional(number)
        restore_point_in_time          = optional(string)
        recover_database_id            = optional(string)
        recovery_point_id              = optional(string)
        restore_dropped_database_id    = optional(string)
    }))
}