data "azurerm_resource_group" "rg" {
    for_each = var.vnetn
    name = each.value.rg_name
}