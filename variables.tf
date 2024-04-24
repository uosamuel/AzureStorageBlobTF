variable "resource_group_name" {
  default = "myresourcegroupname"
}

variable "resource_group_geolocation" {
  default = "West Europe"
}


#your storage account name has to be unique across all of Azure
variable "storage_account_name" {
  default = "myuniqueaccountname"
}

variable "storage_container_name" {
  default = "mycontainername"
}