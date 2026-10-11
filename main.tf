resource "confluent_peering" "peerings" {
  for_each = var.peerings

  display_name = each.value.display_name

  environment {
    id = each.value.environment.id
  }

  network {
    id = each.value.network.id
  }

  dynamic "aws" {
    for_each = each.value.aws != null ? [each.value.aws] : []
    content {
      account         = aws.value.account
      customer_region = aws.value.customer_region
      routes          = aws.value.routes
      vpc             = aws.value.vpc
    }
  }

  dynamic "azure" {
    for_each = each.value.azure != null ? [each.value.azure] : []
    content {
      customer_region = azure.value.customer_region
      tenant          = azure.value.tenant
      vnet            = azure.value.vnet
    }
  }

  dynamic "gcp" {
    for_each = each.value.gcp != null ? [each.value.gcp] : []
    content {
      import_custom_routes = gcp.value.import_custom_routes
      project              = gcp.value.project
      vpc_network          = gcp.value.vpc_network
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
    }
  }
}

