###cloud vars
variable "token" {
  type        = string
  sensitive   = true
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  sensitive   = true
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  sensitive   = true
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "vpc_name" {
  type        = string
  default     = "my_vpc"
  description = "VPC network&subnet name"
}

variable "subnet_name" {
  type        = string
  default     = "my_subnet"
  description = "Name of public subnet"
}

variable "cidr" {
  type        = list(string)
  default     = ["192.168.0.0/16"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "zones" {
  type    = list(string)
  default = ["ru-central1-a", "ru-central1-b", "ru-central1-d"]
}


###instance_groups vars
variable "instance_groups" {
  type = map(object({
    name_prefix     = string
    name_vm         = string
    zones           = list(string)
    platform_id     = string
    cores           = number
    memory          = number
    core_fraction   = number
    preemptible     = bool
    image_id        = string
    nat             = bool
    ns_type         = string
    fix_size        = number
    max_unavailable = number
    max_creating    = number
    max_deleting    = number
    max_expansion   = number
  }))
  default = {
    k8s_masters = {
      name_prefix     = "k8s-master"
      name_vm         = "master"
      zones           = ["ru-central1-a", "ru-central1-b", "ru-central1-d"]
      platform_id     = "standard-v2"
      cores           = 2
      memory          = 4
      core_fraction   = 20
      preemptible     = true
      image_id        = "fd8o9coe41hlf4uc194g"
      nat             = true
      ns_type         = "STANDARD"
      fix_size        = 3
      max_unavailable = 1
      max_creating    = 1
      max_deleting    = 1
      max_expansion   = 1
    },
    k8s_workers = {
      name_prefix     = "k8s-worker"
      name_vm         = "worker"
      zones           = ["ru-central1-a", "ru-central1-b", "ru-central1-d"]
      platform_id     = "standard-v2"
      cores           = 2
      memory          = 4
      core_fraction   = 20
      preemptible     = true
      image_id        = "fd8o9coe41hlf4uc194g"
      nat             = true
      ns_type         = "STANDARD"
      fix_size        = 3
      max_unavailable = 1
      max_creating    = 1
      max_deleting    = 1
      max_expansion   = 1
    }
  }
}


