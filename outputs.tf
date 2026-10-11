output "peerings_id" {
  description = "Map of id values across all peerings, keyed the same as var.peerings except keys with no id are omitted"
  value       = { for k, v in confluent_peering.peerings : k => v.id if v.id != null && length(v.id) > 0 }
}
output "peerings_aws" {
  description = "Map of aws values across all peerings, keyed the same as var.peerings except keys with no aws are omitted"
  value       = { for k, v in confluent_peering.peerings : k => one(v.aws) if v.aws != null && length(v.aws) > 0 }
}
output "peerings_azure" {
  description = "Map of azure values across all peerings, keyed the same as var.peerings except keys with no azure are omitted"
  value       = { for k, v in confluent_peering.peerings : k => one(v.azure) if v.azure != null && length(v.azure) > 0 }
}
output "peerings_display_name" {
  description = "Map of display_name values across all peerings, keyed the same as var.peerings except keys with no display_name are omitted"
  value       = { for k, v in confluent_peering.peerings : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "peerings_environment" {
  description = "Map of environment values across all peerings, keyed the same as var.peerings except keys with no environment are omitted"
  value       = { for k, v in confluent_peering.peerings : k => one(v.environment) if v.environment != null && length(v.environment) > 0 }
}
output "peerings_gcp" {
  description = "Map of gcp values across all peerings, keyed the same as var.peerings except keys with no gcp are omitted"
  value       = { for k, v in confluent_peering.peerings : k => one(v.gcp) if v.gcp != null && length(v.gcp) > 0 }
}
output "peerings_network" {
  description = "Map of network values across all peerings, keyed the same as var.peerings except keys with no network are omitted"
  value       = { for k, v in confluent_peering.peerings : k => one(v.network) if v.network != null && length(v.network) > 0 }
}

