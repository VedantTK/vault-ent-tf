terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.6.2"
    }
  }
}

provider "docker" {}


resource "docker_image" "vault_enterprise" {
  name         = var.vault_image
  keep_locally = false
}

resource "docker_container" "vault_enterprise" {
  name  = var.vault_name
  image = docker_image.vault_enterprise.name
  ports {
    internal = 8200
    external = 8200
  }
  env = [
    "VAULT_DEV_ROOT_TOKEN_ID=root",
    "VAULT_DEV_LISTEN_ADDRESS=0.0.0.0:8200",
    "VAULT_LICENSE_PATH=/vault/config/vault.hclic"
  ]
  volumes {
    host_path      = var.vault_license_path
    container_path = "/vault/config/vault.hclic"
  }
  capabilities {
    add = ["IPC_LOCK"]
  }
  restart = "unless-stopped"
}

# Deploying Open Source Vault using terraform Docker Provider
# resource "docker_image" "vault" {
#   name         = "hashicorp/vault"
#   keep_locally = false
# }

# resource "docker_container" "vault" {
#   image = docker_image.vault.name
#   name  = "vault-server"
#   ports {
#     internal = 8200
#     external = 8200
#   }

#   env = [
#     "VAULT_DEV_ROOT_TOKEN_ID=root",
#     "VAULT_DEV_LISTEN_ADDRESS=0.0.0.0:8200"
#   ]
# }

