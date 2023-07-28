# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# Declare the Terraform Module for Cloud Adoption Framework
# Enterprise-scale and provide a base configuration.
module "enterprise_scale" {
  source  = "Azure/caf-enterprise-scale/azurerm"
  version = "~> 1.0.0"

  providers = {
    azurerm              = azurerm
    azurerm.management   = azurerm.management
    azurerm.connectivity = azurerm.connectivity
  }

  # Base module configuration settings.
  root_parent_id   = data.azurerm_client_config.current.tenant_id
  root_id          = local.root_id
  root_name        = local.root_name
  default_location = local.default_location

  # Control deployment of the core landing zone hierachy.
  deploy_core_landing_zones   = true
  deploy_FME_landing_zones   = local.FME_corp_landing_zones
  
}
