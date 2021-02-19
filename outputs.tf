
output "private_endpoints" {
  value = var.peering_enabled ? mongodbatlas_cluster.peer_database[0].connection_strings : mongodbatlas_cluster.no_peer_database[0].connection_strings
}
output "mongo_app_user_password" {
  value = [random_string.user_password[*].result]
}

output "mongo_admin_user_password" {
  value = random_string.admin_password.result
}
output "mongo_audit_user_password" {
  value = [random_string.audit_password[*].result]
}
output "mongodb_peering_id" {
  value = mongodbatlas_network_peering.azure[*].atlas_id
}
