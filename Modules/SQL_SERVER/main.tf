resource "azurerm_mssql_server" "server" {
  for_each            = var.servers
  name                = each.value.server_name
  resource_group_name = data.azurerm_resource_group.rg[each.key].name
  location            = data.azurerm_resource_group.rg[each.key].location
  version             = each.value.version
 administrator_login           = each.value.admin_login
  administrator_login_password  = data.azurerm_key_vault_secret.server_secret[each.key].value














#   administrator_login = (
#     each.value.azuread_administrator != null
#     ? null
#     : each.value.administrator_login
#   )

#   administrator_login_password_wo = (
#     each.value.azuread_administrator != null
#     ? null
#     : each.value.administrator_login_password_wo
#   )

#   administrator_login_password = (
#     each.value.azuread_administrator != null
#     ? null
#     : each.value.administrator_login_password
#   )

#   administrator_login_password_wo_version = (
#     each.value.azuread_administrator != null
#     ? null
#     : each.value.administrator_login_password_wo_version
#   )

#   dynamic "azuread_administrator" {
#     for_each = each.value.azuread_administrator == null ? [] : [each.value.azuread_administrator]

#     content {
#       login_username = azuread_administrator.value.login_username
#       object_id      = data.azuread_group.servergroup[each.key].id
#       tenant_id      = try(azuread_administrator.value.tenant_id, null)
#       azuread_authentication_only = try(
#         azuread_administrator.value.azuread_authentication_only,
#         null
#       )
#     }
#   }

#   connection_policy                        = lookup(each.value, "connection_policy", null)
#   express_vulnerability_assessment_enabled = lookup(each.value, "express_vulnerability_assesment_enabled", null)
#   dynamic "identity" {
#     for_each = each.value.identity != null ? [each.value.identity] : []
#     content {
#       type         = identity.value.type
#       identity_ids = try(identity.value.identity_ids, null)

#     }
#   }
#   transparent_data_encryption_key_vault_key_id = lookup(each.value, "transparent_data_encryption_key_vault_key_id", null)
#   minimum_tls_version                          = lookup(each.value, "monimum_tls_version", null)
#   public_network_access_enabled                = lookup(each.value, "public_network_access_enabled", null)
#   outbound_network_restriction_enabled         = lookup(each.value, "outbound_network_restriction_enabled", null)
#   primary_user_assigned_identity_id            = lookup(each.value, "primary_user_assigned_identity_id", null)
#   tags                                         = lookup(each.value, "tags", null)

}
