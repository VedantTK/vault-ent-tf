# 🚀 Vault Enterprise with Terraform

This project uses **Terraform** to deploy **HashiCorp Vault Enterprise** inside a Docker container.

---

## 📁 Project Structure

    vault-ent-tf/
    ├── main.tf # Terraform configuration
    ├── vault.hclic # Vault Enterprise license file
    ├── variables.tf # Input variables
    ├── outputs.tf # Output values
    ├── README.md # Project documentation
    
---

## ✅ Prerequisites

    Make sure you have the following installed and configured before using this project:
    
    - [Docker](https://docs.docker.com/get-docker/) (Ensure Docker daemon is running)
    - [Terraform v1.x](https://developer.hashicorp.com/terraform/downloads)
    - A valid Vault Enterprise license file named `vault.hclic` placed in the project root
    - Ensure port **8200** (and optionally **8201**) is free on your system

---

## ⚙️ Features

    - Deploys **Vault Enterprise** in a Docker container using Terraform
    - Automatically mounts license file
    - Enables **KV v2 secrets engine**
    - Creates a test **secret**, **policy**, and **token**
    - Outputs useful Vault access info

---

## 🧪 Usage

### 1. Clone the repository

```bash

    git clone https://github.com/VedantTK/vault-ent-tf.git
    cd vault-ent-tf
    
    2. Add your Vault license
    Place your vault.hclic file in the project directory:
    cp /path/to/your/vault.hclic .
    
    3. Initialize Terraform
    
    terraform init
    
    4. Apply the configuration
    
    terraform apply -auto-approve
    This will:
    
    Pull the Vault Enterprise Docker image
    
    Create and start the container
    
    Mount the license
    
    Enable the KV v2 secrets engine
    
    Create a sample secret, policy, and token
    
    🧰 Verify Vault is Running
    Check Docker container status:
    
    
    docker ps
    You should see a container named (or image) vault-enterprise-server running and listening on port 8200.
    
    Access Vault at:
    👉 http://localhost:8200
    
    🔐 Interacting with Vault
    Use the Vault CLI or HTTP API to interact with your Vault server.
    
    You can also export the Vault address and token:
    
    export VAULT_ADDR='http://localhost:8200'
    export VAULT_TOKEN='<token-from-terraform-output>'
    Then run Vault commands like:
    
    vault status
    vault kv get secret/my-secret
    🧼 Teardown
    To destroy the infrastructure and remove the Vault container:
    
    terraform destroy -auto-approve
    📄 License
    This project requires a valid Vault Enterprise license.
    You must provide your own vault.hclic file — it is not included in this repo.
