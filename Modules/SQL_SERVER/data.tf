data "azurerm_resource_group" "rg" {
    for_each = var.servers
    name = each.value.rg_name
}
# data "azuread_group" "servergroup" {
#     for_each = var.servers
#     display_name = each.value.display_name
# }
data "azurerm_key_vault_secret" "server_secret" {
    for_each = var.servers
    name = each.value.secret_name
    key_vault_id = data.azurerm_key_vault.kv[each.key].id
}
data "azurerm_key_vault" "kv" {
    for_each = var.servers
    name = each.value.vault_name
    resource_group_name = each.value.rgs_name
}