#creates a resource group for the services below
resource "azurerm_resource_group" "demo-resource-group" {
  name     = var.resource_group_name
  location = var.resource_group_geolocation
}

#creates a storage account for your containers
resource "azurerm_storage_account" "demo-storage-account-tf" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.demo-resource-group.name
  location                 = azurerm_resource_group.demo-resource-group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

#creates a container to store your content
resource "azurerm_storage_container" "demo-storage-container-tf" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.demo-storage-account-tf.name
  container_access_type = "private"
}

#uploads a file/blob into the above created container
resource "azurerm_storage_blob" "my-file-demo" {
  name                   = "my-file-name-and-its.extention"
  storage_account_name   = azurerm_storage_account.demo-storage-account-tf.name
  storage_container_name = azurerm_storage_container.demo-storage-container-tf.name
  type                   = "Block"
  source                 = "path-to-my-file"
}