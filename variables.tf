variable "vault_image" {
  description = "The Docker image for Vault Enterprise"
  type        = string
  default     = "hashicorp/vault-enterprise:latest" #for oss vault use hashicorp/vault
}

variable "vault_license_path" {
  description = "The path to the Vault Enterprise license file on the host"
  type        = string
  default     = "./vault.hclic"

}

variable "vault_name" {
  description = "The name of the Vault container"
  type        = string
  default     = "vault-enterprise"

}
