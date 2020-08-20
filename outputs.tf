output "private_endpoints" {
  value = mongodbatlas_cluster.database.connection_strings
}
output "mongo_app_user_password" {
  value = random_string.password[1].result
}

output "mongo_admin_user_password" {
  value = random_string.password[0].result
}

output "mongodb_peering_id" {
  value = mongodbatlas_network_peering.azure.atlas_id
}