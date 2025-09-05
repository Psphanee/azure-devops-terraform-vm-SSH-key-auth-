# Azure DevOps + Terraform: VM deployment (SSH key auth)


This repo demonstrates deploying a Linux VM in Azure using Terraform executed from an Azure DevOps pipeline. This version uses SSH public-key authentication for the VM.


## Quick steps
1. Create a backend storage account + container for Terraform state (see `create_backend.sh`).
2. Create a Service Principal and store credentials in Azure DevOps pipeline variables (or create an ARM service connection).
3. Add your SSH public key to the pipeline variables (see below). Do **not** commit private keys.
4. Update `terraform.tfvars` (or set pipeline variables). Do **not** commit secrets or private keys.
5. Push to Azure DevOps and run the pipeline using `azure-pipelines.yml`.


## Pipeline variables (required)
- `ARM_CLIENT_ID` (secret)
- `ARM_CLIENT_SECRET` (secret)
- `ARM_TENANT_ID` (secret)
- `ARM_SUBSCRIPTION_ID`
- `VM_ADMIN_SSH_PUB` (your **SSH public key**, e.g. contents of `~/.ssh/id_rsa.pub`)


> The pipeline sets `TF_VAR_admin_ssh_key` from `VM_ADMIN_SSH_PUB`, so Terraform will pick it up.


## Security notes
- Never store private keys in the repo or in pipeline variables. Only store the public key.
- Prefer an Azure DevOps service connection for auth instead of raw SP secrets.