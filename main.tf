# ----------------------------------------
# Launch MongoDB Cluster in Atlas
# ----------------------------------------

# create a project

resource "mongodbatlas_project" "project" {
  name   = format("%s-project-%s", var.name, var.env)
  org_id = var.atlas_mongo_org
  teams {
    team_id    = var.team
    role_names = ["GROUP_OWNER"]
  }
  teams {
    team_id    = var.audit_team
    role_names = ["GROUP_READ_ONLY", "GROUP_DATA_ACCESS_READ_ONLY"]
  }
}

resource "mongodbatlas_network_container" "peer" {
  count            = var.peering_enabled ? 1 : 0
  project_id       = mongodbatlas_project.project.id
  atlas_cidr_block = var.atlas_mongo_cidr
  provider_name    = var.atlas_mongo_provider
  region           = var.atlas_mongo_region

}

resource "mongodbatlas_network_peering" "azure" {
  count                 = var.peering_enabled ? 1 : 0
  project_id            = mongodbatlas_project.project.id
  container_id          = mongodbatlas_network_container.peer[0].container_id
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

resource "mongodbatlas_project_ip_whitelist" "public" {
  count      = var.public_access_enabled ? 1 : 0
  depends_on = [mongodbatlas_cluster.database]
  project_id = mongodbatlas_project.project.id
  cidr_block = "0.0.0.0/0"
  comment    = "public cluster access"
}

resource "mongodbatlas_cluster" "database" {
  project_id                                      = mongodbatlas_project.project.id
  num_shards                                      = var.number_of_shards
  name                                            = format("%s-cluster-%s", var.name, var.env)
  provider_backup_enabled                         = var.provider_backup_enabled
  auto_scaling_disk_gb_enabled                    = var.auto_scaling_disk_gb_enabled
  auto_scaling_compute_enabled                    = var.auto_scaling_compute_enabled
  auto_scaling_compute_scale_down_enabled         = var.auto_scaling_compute_scale_down_enabled
  provider_auto_scaling_compute_max_instance_size = var.provider_auto_scaling_compute_max_instance_size
  provider_auto_scaling_compute_min_instance_size = var.provider_auto_scaling_compute_min_instance_size
  mongo_db_major_version                          = var.atlas_mongo_version
  cluster_type                                    = var.atlas_mongo_cluster_type
  replication_specs {
    num_shards = 1
    regions_config {
      region_name     = var.atlas_mongo_region
      electable_nodes = 3
      priority        = 7
      read_only_nodes = 0
    }
  }

  provider_name               = var.atlas_mongo_provider
  provider_instance_size_name = var.atlas_mongo_offering
}

resource "mongodbatlas_database_user" "admin" {
  username           = format("%s-mongo-admin", var.env)
  password           = random_string.admin_password.result
  project_id         = mongodbatlas_project.project.id
  auth_database_name = "admin"

  roles {
    role_name     = "readWriteAnyDatabase"
    database_name = "admin"
  }
}

resource "mongodbatlas_database_user" "app_user" {
  count              = length(var.mongodb_collection_name)
  project_id         = mongodbatlas_project.project.id
  username           = format("%s-mongo-%s", var.env, element(var.mongodb_collection_name, count.index))
  password           = random_string.user_password[count.index].result
  auth_database_name = "admin"

  roles {
    role_name     = "readWrite"
    database_name = element(var.mongodb_collection_name, count.index)
  }
  labels {
    key   = "team"
    value = var.team
  }
}

resource "mongodbatlas_database_user" "audit_user" {
  count              = length(var.mongodb_collection_name)
  project_id         = mongodbatlas_project.project.id
  username           = format("%s-mongo-%s-audit", var.env, element(var.mongodb_collection_name, count.index))
  password           = random_string.audit_password[count.index].result
  auth_database_name = "admin"

  roles {
    role_name     = "read"
    database_name = element(var.mongodb_collection_name, count.index)
  }
  labels {
    key   = "team"
    value = var.audit_team
  }
}

resource "random_string" "user_password" {
  count     = length(var.mongodb_collection_name)
  length    = 25
  special   = false
  upper     = true
  min_lower = 4
  min_upper = 4
}


resource "random_string" "admin_password" {
  length    = 25
  special   = false
  upper     = true
  min_lower = 4
  min_upper = 4
}

resource "random_string" "audit_password" {
  count     = length(var.mongodb_collection_name)
  length    = 25
  special   = false
  upper     = true
  min_lower = 4
  min_upper = 4
}
