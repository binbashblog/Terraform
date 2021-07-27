# Terraform
My Terraform config files

## Upgrading the code
Running the terraform upgrade command will automatically upgrade the configuration of the modules.

Run terraform plan first to ensure there are no pending changes otherwise this may cause upgrade issues
Run terraform apply after upgrading to the next version to apply upgrades to the Terraform state (be careful, if the state goes bad it may end up destroying your inf, always back it up!)
Also, you may have to manually upgrade providers, especially if they are in-house, the upgrade command will throw an error if that is the case

###Upgrade steps:

You have to upgrade to the next major version first before you can upgrade to the ones after, see the upgrade guides at terraform.io

Download the next available version from the official terraform releases page:
https://releases.hashicorp.com/terraform/

#### Upgrade from Terraform 0.12 to 0.13:
https://releases.hashicorp.com/terraform/0.13.7/terraform_0.13.7_linux_amd64.zip
```
terraform init
terraform plan
terraform 0.13upgrade
terraform apply
```

#### Upgrade from Terraform 0.13 to 0.14
https://releases.hashicorp.com/terraform/0.14.11/terraform_0.14.11_linux_amd64.zip
```
terraform init
terraform plan
terraform 0.14upgrade
terraform apply
```

#### Upgrade from Terraform 0.14 to v1
https://releases.hashicorp.com/terraform/1.0.3/terraform_1.0.3_linux_amd64.zip

Upgrading directly to v1 from 0.14 is supported however check the 0.15 upgrade guide for troubleshooting
```
terraform init
terraform plan
```
For v1, no upgrade command is needed
