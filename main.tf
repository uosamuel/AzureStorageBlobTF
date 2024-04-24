#creates a resource group for the services below
resource "azurerm_resource_group" "demo-resource-group" {
  name     = "my-demo-resource-group"
  location = "West Europe"
}

#creates a storage account for your containers
resource "azurerm_storage_account" "demo-storage-account-tf" {
  name                     = "mydemostorageaccountuche"
  resource_group_name      = azurerm_resource_group.demo-resource-group.name
  location                 = azurerm_resource_group.demo-resource-group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

#creates a container to store your content
resource "azurerm_storage_container" "demo-storage-container-tf" {
  name                  = "my-demo-storage-container"
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