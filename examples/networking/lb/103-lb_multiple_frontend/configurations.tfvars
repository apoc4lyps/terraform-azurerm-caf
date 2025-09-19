global_settings = {
  default_region = "region1"
  regions = {
    region1 = "australiaeast"
  }
}

resource_groups = {
  rg1 = {
    name = "example-lb"
  }
}

public_ip_addresses = {
  lb_pip = {
    name                    = "lb_pip1"
    resource_group_key      = "rg1"
    sku                     = "Standard"
    allocation_method       = "Static"
    ip_version              = "IPv4"
    idle_timeout_in_minutes = "4"
  }
}

vnets = {
  vnet1 = {
    resource_group_key = "rg1"
    vnet = {
      name          = "vnet1"
      address_space = ["10.100.100.0/24"]
    }
    specialsubnets = {}
    subnets = {
      subnet1 = {
        name = "subnet1"
        cidr = ["10.100.100.0/29"]
      }
    }

  }
}

lb = {
  lb1 = {
    name               = "TestLoadBalancer"
    region             = "region1"
    resource_group_key = "rg1"
    frontend_ip_configuration = {
      name = "PublicIPAddress"
      public_ip_address = {
        key = "lb_pip"
      }
    }
    frontend_ip_configurations = {
      public = {
        name = "PublicIPAddress"
        public_ip_address = {
          key = "lb_pip"
        }
      }
      private = {
        name = "PrivateIPAddress"
        subnet = {
          vnet_key = "vnet1"
          key      = "subnet1"
        }
        private_ip_address_allocation = "Static"
        private_ip_address            = "10.100.100.5"
      }
    }
    sku = "Standard"
  }
}


lb_backend_address_pool = {
  lbap1 = {
    loadbalancer = {
      key = "lb1"
    }
    name = "BackEndAddressPool"
  }
}

lb_backend_address_pool_address = {
  lbbapa1 = {
    name = "example"
    backend_address_pool = {
      key = "lbap1"
    }
    virtual_network = {
      key = "vnet1"
    }
    ip_address = "10.0.0.1"
  }
}

lb_outbound_rule = {
  lbor1 = {
    resource_group = {
      key = "rg1"
    }
    loadbalancer = {
      key = "lb1"
    }
    name     = "OutboundRule"
    protocol = "Tcp"
    backend_address_pool = {
      key = "lbap1"
    }

    frontend_ip_configuration = {
      name = "PublicIPAddress"
    }
  }
}

lb_probe = {
  lbp1 = {
    resource_group = {
      key = "rg1"
    }
    loadbalancer = {
      key = "lb1"
    }
    name = "ssh-running-probe"
    port = 22
  }
}

lb_rule = {
  lbr1 = {
    resource_group = {
      key = "rg1"
    }
    loadbalancer = {
      key = "lb1"
    }
    name                           = "LBRule"
    protocol                       = "Tcp"
    frontend_port                  = 3389
    backend_port                   = 3389
    frontend_ip_configuration_name = "PublicIPAddress"
    disable_outbound_snat          = true
  }
  lbr2 = {
    resource_group = {
      key = "rg1"
    }
    loadbalancer = {
      key = "lb1"
    }
    probe = {
      key = "lbp1"
    }
    backend_address_pool = {
      lbap1 = {
        key = "lbap1"
      }
    }
    name                           = "LBRule1"
    protocol                       = "Tcp"
    frontend_port                  = 3389
    backend_port                   = 3389
    frontend_ip_configuration_name = "PrivateIPAddress"
    disable_outbound_snat          = true
  }
}
