resource "azurerm_mssql_database" "db" {
    for_each = var.db
    name = each.value.db_name
    server_id = data.azurerm_mssql_server.server[each.key].id
    auto_pause_delay_in_minutes = lookup(each.value, "auto_pause_delay_in_minutes", null)
    # here -1 means auto pause disabled
    create_mode = lookup(each.value, "create_mode", null)
    dynamic "import" {
        for_each = each.value.import != null ? each.value.import : {}
        content {
            storage_uri = import.value.storage_uri
            storage_key = import.value.storage_key
            storage_key_type = import.value.storage_key_type
            administrator_login = import.value.administrator_login
            administrator_login_password = import.value.administrator_login_password
            authentication_type = import.value.authentication_type
            storage_account_id = lookup(import.value, "storage_account_id", null)
        } 

    }
    creation_source_database_id = lookup(each.value, "creation_source_database_id", null)
    collation = lookup(each.value, "collation", null)
    elastic_pool_id = lookup(each.value, "elastic_pool_id", null)
    enclave_type = lookup(each.value, "enclave_type", null)
    geo_backup_enabled = lookup(each.value, "geo_backup_enabled", null)
    ledger_enabled = lookup(each.value, "ledger_enabled", null)
    license_type = lookup(each.value, "license_type", null)
    dynamic "long_term_retention_policy" {
        for_each = each.value.long_term_retention_policy != null ? each.value.long_term_retention_policy : {}
        content {
            weekly_retention = lookup(long_term_retention_policy.value, "weekly_retention", null)
            monthly_retention = lookup(long_term_retention_policy.value, "monthly_retention", null)
            yearly_retention = lookup(long_term_retention_policy.value, "yearly_retention", null)
            week_of_year = lookup(long_term_retention_policy.value, "week_of_year", null)
            immutable_backups_enabled = lookup(long_term_retention_policy.value, "immutable_backups_enabled", null)
        }
    }
    max_size_gb = lookup(each.value, "max_size_gb", null)
    min_capacity = lookup(each.value, "min_capacity", null)
    restore_point_in_time = lookup(each.value, "restore_point_in_time", null)
    recover_database_id = lookup(each.value, "recover_database_id", null) 
    recovery_point_id = lookup(each.value, "recovery_point_id", null)
    restore_dropped_database_id = lookup(each.value, "restore_dropped_database_id", null)
    
}