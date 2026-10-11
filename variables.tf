variable "peerings" {
  description = <<EOT
Map of peerings, attributes below
Required:
    - environment (block):
        - id (required)
    - network (block):
        - id (required)
Optional:
    - display_name
    - aws (block):
        - account (required)
        - customer_region (required)
        - routes (required)
        - vpc (required)
    - azure (block):
        - customer_region (required)
        - tenant (required)
        - vnet (required)
    - gcp (block):
        - import_custom_routes (optional)
        - project (required)
        - vpc_network (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
EOT

  type = map(object({
    display_name = optional(string)
    environment = object({
      id = string
    })
    network = object({
      id = string
    })
    aws = optional(object({
      account         = string
      customer_region = string
      routes          = list(string)
      vpc             = string
    }))
    azure = optional(object({
      customer_region = string
      tenant          = string
      vnet            = string
    }))
    gcp = optional(object({
      import_custom_routes = optional(bool)
      project              = string
      vpc_network          = string
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
    }))
  }))
  # Note: 9 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

