variable "attachment" {
    type = map(object({
        subnet_name = string
        vnet_name = string
        rg_name = string
        nsg_name = string
    }))
}