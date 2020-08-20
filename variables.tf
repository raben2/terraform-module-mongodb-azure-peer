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
  default     = "M2"
}

variable "atlas_mongo_replicas" {
  type        = number
  description = "replication factor"
  default     = 3
}

variable "atlas_region" {
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
  type        = string
  description = "main collection name"
  default     = ""
}
variable "secondary_collection" {
  type        = string
  description = "secondary collection"
  default     = "feature-template"
}

variable "env" {
  type        = string
  description = "environment"
  default     = ""
}

variable "name" {
  type        = string
  description = "base name"
  default     = "product-core"
}

variable "team" {
  type        = string
  description = "development team"
  default     = "oaktree"
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
  default     = ""
}

variable "number_of_shards" {
  type        = number
  description = "shards created per default"
  default     = 1
}