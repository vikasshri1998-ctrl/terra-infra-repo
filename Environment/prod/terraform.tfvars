rgn = {
  rg1 = {
    rg_name    = "nik_prod_rg"
    location   = "Korea Central"
    managed_by = "nik-devopsinsider"
    tags = {
      environment = "prod"
      owner       = "nik-devopsinsider"
    }
  }
  rg2 = {
    rg_name  = "nik_prod_network_rg"
    location = "Korea Central"
    tags = {
      environment = "prod"
      owner       = "nik-devopsinsider"
    }
  }
}
vnetn = {
  vnet1 = {
    vnet_name     = "nik_prod_vnet"
    address_space = ["10.0.0.0/16"]
    rg_name       = "nik_prod_rg"
    subnet = {
      subnet1 = {
        subnet_name      = "nik_frontend_subnet"
        address_prefixes = ["10.0.1.0/24"]

      }
      subnet2 = {
        subnet_name      = "nik_backend_subnet"
        address_prefixes = ["10.0.2.0/24"]
      }
    }
  }
}
nsg = {
  nsg1 = {
    nsg_name = "nik_prod_nsg"
    rg_name  = "nik_prod_rg"
    security_rule = {
      SSH = {
        security_name              = "SSH_enabled"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "Internet"
        destination_address_prefix = "*"
        access                     = "Allow"
        priority                   = 100
        direction                  = "Inbound"
      }
      HTTP = {
        security_name              = "HTTP_Enabled"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "Internet"
        destination_address_prefix = "*"
        access                     = "Allow"
        priority                   = 200
        direction                  = "Inbound"
      }

    }
  }
}
vms = {
  vm1 = {
    vm_name     = "nik_frontend_vm"
    rg_name     = "nik_prod_rg"
    nic_name    = "nik_frontend_nic"
    secret_name = "nikFrontendVMPassword"
    vault_name  = "genenric1keyvault"
    vm_size     = "Standard_D2s_v3"
    rgs_name = "gen1rgt"
    os_profile_linux_config = {
      disable_password_authentication = false
    }
    storage_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
    storage_os_disk = {
      disk_name         = "nik_frontend_os_disk"
      caching           = "ReadWrite"
      create_option     = "FromImage"
      managed_disk_type = "Standard_LRS"
    }
    os_profile = {
      computer_name  = "nik-frontend-vm"
      admin_username = "devopsinsider"
    }

  }
  vm2 = {

    vm_name     = "nik_backend_vm"
    rg_name     = "nik_prod_rg"
    nic_name    = "nik_backend_nic"
    secret_name = "nikbackendVMPassword"
    vault_name  = "genenric1keyvault"
    vm_size     = "Standard_D2s_v3"
    rgs_name = "gen1rgt"
    os_profile_linux_config = {
      disable_password_authentication = false
    }
    storage_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
    storage_os_disk = {
      disk_name         = "nik_backend_os_disk"
      caching           = "ReadWrite"
      create_option     = "FromImage"
      managed_disk_type = "Standard_LRS"
    }
    os_profile = {
      computer_name  = "nik-backend-vm"
      admin_username = "devopsengineer"
    }

  }
}

nic = {
  nic1 = {
    nic_name    = "nik_frontend_nic"
    rg_name     = "nik_prod_rg"
    subnet_name = "nik_frontend_subnet"
    vnet_name   = "nik_prod_vnet"
    pip_name    = "frontend-pip"
    ip_configuration = {
      ip_configuration_name         = "frontend_ip_config"
      private_ip_address_allocation = "Dynamic"

    }
  }
  nic2 = {
    nic_name    = "nik_backend_nic"
    rg_name     = "nik_prod_rg"
    subnet_name = "nik_backend_subnet"
    vnet_name   = "nik_prod_vnet"
    pip_name    = "backend-pip"
    ip_configuration = {
      ip_configuration_name         = "backend_ip_config"
      private_ip_address_allocation = "Dynamic"

    }
  }
}
pip = {
  pip1 = {
    pip_name          = "frontend-pip"
    rg_name           = "nik_prod_rg"
    allocation_method = "Static"
  }
  pip2 = {
    pip_name          = "backend-pip"
    rg_name           = "nik_prod_rg"
    allocation_method = "Static"
  }
}

server = {
  sqlserver1 = {
    server_name  = "nikprodsqlserver"
    rg_name      = "nik_prod_rg"
    version      = "12.0"
    vault_name = "genenric1keyvault"
    secret_name = "nik-server-secret"
    admin_login = "devopsinsider"
    rgs_name = "gen1rgt"
    # display_name = "server_group"
    # azuread_administrator = {
    #   login_username              = "devopsinsider"
    #   azuread_authentication_only = true
    # }
    # identity = {
    #   type = "SystemAssigned"
    # }
    # minimum_tls_version = "1.2"
  }
}
db = {
  db1 = {
    db_name     = "nik-db"
    server_name = "nikprodsqlserver"
    rg_name     = "nik_prod_rg"
  }
}
attachment = {
  attach1 = {
    subnet_name = "nik_frontend_subnet"
    vnet_name = "nik_prod_vnet"
    rg_name = "nik_prod_rg"
    nsg_name = "nik_prod_nsg"
  }
}
