terraform {
  required_providers {
    mongodbatlas = {
      source = "terraform-providers/mongodbatlas"
    }
    random = {
      source = "hashicorp/random"
    }
  }
  required_version = ">= 0.13"
}
