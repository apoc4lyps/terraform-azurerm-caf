locals {
  backend_pools_linux_web_apps = {
    for key, value in try(var.settings.backend_pools, {}) : key => flatten(
      [
        for web_app_key, web_app in try(value.linux_web_apps, {}) : [
          try(var.linux_web_apps[web_app.lz_key][web_app.key].default_hostname, var.linux_web_apps[var.client_config.landingzone_key][web_app.key].default_hostname)
        ]
      ]
    ) if lookup(value, "linux_web_apps", false) != false
  }

  backend_pools_windows_web_apps = {
    for key, value in try(var.settings.backend_pools, {}) : key => flatten(
      [
        for web_app_key, web_app in try(value.windows_web_apps, {}) : [
          try(var.windows_web_apps[web_app.lz_key][web_app.key].default_hostname, var.windows_web_apps[var.client_config.landingzone_key][web_app.key].default_hostname)
        ]
      ]
    ) if lookup(value, "windows_web_apps", false) != false
  }

  # backend_pools_fqdn = {
  #   for key, value in var.settings.backend_pools : key => flatten(
  #     [
  #       try(value.fqdns, [])
  #     ]
  #   ) if lookup(value, "fqdns", false) != false
  # }

  # backend_pools_vmss = {
  #   for key, value in var.settings : key = > flatten(
  #     [
  #       try(value.backend_pool.vmss,)
  #     ]
  #   )
  # }

  backend_pools = {
    for key, value in try(var.settings.backend_pools, {}) : key => {
      address_pools = join(" ", try(flatten(
        [
          try(local.backend_pools_linux_web_apps[key], []),
          try(local.backend_pools_windows_web_apps[key], []),
          try(value.fqdns, []),
          try(value.ip_addresses, [])
        ]
      ), null))
    }
  }
}
