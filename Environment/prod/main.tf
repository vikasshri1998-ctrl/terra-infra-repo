module "rg" {
  source = "../../Modules/RG"
  rgn    = var.rgn
}
module "vnet" {
  depends_on = [module.rg]
  source     = "../../Modules/NETWORKING"
  vnetn      = var.vnetn
}
module "nsg" {
  depends_on = [module.rg]
  source     = "../../Modules/NSG"
  nsg        = var.nsg
}
module "nic" {
  depends_on = [module.vnet]
  source     = "../../Modules/NIC"
  nic        = var.nic
}
module "compute" {
  depends_on = [module.nic]
  source     = "../../Modules/COMPUTE"
  vms        = var.vms
}
module "pip" {
  depends_on = [module.rg]
  source     = "../../Modules/PIP"
  pip        = var.pip
}
module "dbs" {
  depends_on = [module.sql_server]
  source     = "../../Modules/SQL_DATABASE"
  db         = var.db
}


module "sql_server" {
  source     = "../../Modules/SQL_SERVER"
  depends_on = [module.rg]
  servers    = var.server
}

module "nsg_attachment" {
  depends_on = [module.nsg, module.vnet]
  source = "../../Modules/nsg-attachment-subnet"
  attachment = var.attachment
}

