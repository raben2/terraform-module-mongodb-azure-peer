// mongoDB cluster configuration vars

# Mongo atlas
variable "atlas_mongo_org" {
  type        = string
  description = "mongodb organization id"
  default     = ""
}

variable "atlas_mongo_version" {
  type        = string
  description = "database version"
  default     = ""
}

variable "atlas_mongo_offering" {
  type        = string
  description = "instance type to use"
  default     = "M20"
}

variable "atlas_mongo_replicas" {
  type        = number
  description = "replication factor"
  default     = 3
}

variable "atlas_mongo_region" {
  type        = string
  description = "atlas mongo identifier for azure region"
  default     = "EUROPE_WEST"
}
variable "atlas_mongo_cidr" {
  type        = string
  description = "target cidr for the peering connection"
  default     = ""
}

variable "atlas_mongo_provider" {
  type        = string
  description = "Cloud provider"
  default     = ""
}

variable "auto_scaling_disk_gb_enabled" {
  type        = bool
  description = "Specifies whether disk auto-scaling is enabled. For M2 and M5 it must be false. "
  default     = false
}
variable "auto_scaling_compute_enabled" {
  type        = bool
  description = "Specifies wether compute up scaling is enabled."
  default     = false
}
variable "auto_scaling_compute_scale_down_enabled" {
  type        = bool
  description = "Specifies wether compute down scaling is enabled."
  default     = false
}
variable "provider_auto_scaling_compute_max_instance_size" {
  type        = string
  description = "maximum instance size if scaling enabled"
  default     = "M20"
}
variable "provider_auto_scaling_compute_min_instance_size" {
  type        = string
  description = "minimum instance size if scaling enabled"
  default     = "M10"
}
variable "disk_size_gb" {
  type        = number
  description = "The size in gigabytes of the server’s root volume. Maximum possible value of 4096 (i.e., 4 TB), minimum 10GB. "
  default     = 10
}

variable "provider_backup_enabled" {
  type        = bool
  default     = true
  description = "Set to true to enable Atlas continuous backups for the cluster"
}

variable "mongodb_collection_name" {
  type        = list(string)
  description = "main collection name(s)"
  default     = []
}

variable "env" {
  type        = string
  description = "environment"
  default     = ""
}

variable "name" {
  type        = string
  description = "base name"
  default     = ""
}

variable "team" {
  type        = string
  description = "MongoDB atlas Team for project access"
  default     = ""
}
variable "audit_team" {
  type        = string
  description = "mongo atlas team for read only project access"
  default     = ""
}
variable "tenant" {
  type        = string
  description = "azure ad tenant id"
  default     = ""
}

variable "subscription" {
  type        = string
  description = "azure subscription id"
  default     = ""
}

variable "resource_group_name" {
  type        = string
  description = "azure resource group name"
  default     = ""
}

variable "vnet_name" {
  type        = string
  description = "name of the peering vnet"
  default     = ""
}

variable "peer_cidr" {
  type        = string
  description = "cidr subnet of the vnet for peering"
  default     = "0.0.0.0/0"
}

variable "number_of_shards" {
  type        = number
  description = "shards created per default"
  default     = 1
}

variable "peering_enabled" {
  type        = bool
  default     = false
  description = "Helper variable for network peering"
}

variable "public_access_enabled" {
  type        = bool
  default     = false
  description = "allow database access from everywhere"
}

variable "atlas_mongo_cluster_type" {
  type        = string
  default     = "REPLICASET"
  description = "Configure cluster type"

}