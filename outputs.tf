
output "private_endpoints" {
  value = mongodbatlas_cluster.database.connection_strings 
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
