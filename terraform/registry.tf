resource "yandex_container_registry" "diplom_registry" {
  name      = var.registry_name
  folder_id = var.folder_id
}

output "registry_url" {
  value = yandex_container_registry.diplom_registry.id
}
