# ----------------------------------------
# Launch MongoDB Cluster in Atlas
# ----------------------------------------

# create a project

resource "mongodbatlas_project" "project" {
  name   = format("%s-project-%s", var.name, var.env)
  org_id = var.atlas_mongo_org
}

resource "mongodbatlas_network_container" "peer" {
  project_id       = mongodbatlas_project.project.id
  atlas_cidr_block = var.atlas_mongo_cidr
  provider_name    = var.atlas_mongo_provider
  region           = var.atlas_mongo_region

}

resource "mongodbatlas_network_peering" "azure" {
  project_id            = mongodbatlas_project.project.id
  container_id          = mongodbatlas_network_container.peer.container_id
  atlas_cidr_block      = var.atlas_mongo_cidr
  provider_name         = var.atlas_mongo_provider
  azure_directory_id    = var.tenant
  azure_subscription_id = var.subscription
  resource_group_name   = var.resource_group_name
  vnet_name             = var.vnet_name
}

resource "mongodbatlas_project_ip_whitelist" "rest" {
  project_id = mongodbatlas_project.project.id
  cidr_block = var.peer_cidr
  comment    = format("cidr block for %s", var.vnet_name)

}

resource "mongodbatlas_cluster" "database" {
  depends_on = [mongodbatlas_network_peering.azure]
  project_id = mongodbatlas_project.project.id
  num_shards = var.number_of_shards
  name       = format("%s-cluster-%s", var.name, var.env)

  replication_factor           = var.atlas_mongo_replicas
  provider_backup_enabled      = var.provider_backup_enabled
  auto_scaling_disk_gb_enabled = var.auto_scaling_disk_gb_enabled
  mongo_db_major_version       = var.atlas_mongo_version


  provider_name               = var.atlas_mongo_provider
  provider_instance_size_name = var.atlas_mongo_offering
  provider_region_name        = var.atlas_mongo_region
}


resource "mongodbatlas_database_user" "admin" {
  username           = format("%s-mongo-admin", var.env)
  password           = random_string.password[0].result
  project_id         = mongodbatlas_project.project.id
  auth_database_name = "admin"

  roles {
    role_name     = "readWriteAnyDatabase"
    database_name = "admin"
  }
}

resource "mongodbatlas_database_user" "app_user" {
  project_id         = mongodbatlas_project.project.id
  username           = format("%s-mongo-app", var.env)
  password           = random_string.password[1].result
  auth_database_name = "admin"

  roles {
    role_name     = "readWrite"
    database_name = var.mongodb_collection_name
  }
  roles {
    role_name     = "readWrite"
    database_name = var.secondary_collection
  }
  labels {
    key   = "team"
    value = var.team
  }
}


resource "random_string" "password" {
  count     = 2
  length    = 25
  special   = false
  upper     = true
  min_lower = 4
  min_upper = 4
}
