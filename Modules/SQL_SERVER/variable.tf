variable "servers" {
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
        #     azuread_administrator_only = optional(bool)
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