# Terraform
My Terraform config files

## Upgrading the code
Running the terraform upgrade command will automatically upgrade the configuration of the modules.

Run terraform plan first to ensure there are no pending changes otherwise this may cause upgrade issues
Run terraform apply after upgrading to the next version to apply upgrades to the Terraform state (be careful, if the state goes bad it may end up destroying your inf, always back it up!)
Also, you may have to manually upgrade providers, especially if they are in-house, the upgrade command will throw an error if that is the case

###Upgrade steps:

You have to upgrade to the next major version first before you can upgrade to the ones after, see the upgrade guides at terraform.io

Download the next available version from the official terraform github repository:

#### Upgrade from Terraform 0.12 to 0.13:
https://github.com/hashicorp/terraform/archive/refs/tags/v0.13.7.zip
```
terraform 0.13upgrade
terraform apply
```

#### Upgrade from Terraform 0.13 to 0.14
https://github.com/hashicorp/terraform/archive/refs/tags/v0.14.11.zip
```
terraform 0.14upgrade
terraform apply
```

#### Upgrade from Terraform 0.14 to v1
Upgrading directly to v1 from 0.14 is supported however check the 0.15 upgrade guide for troubleshooting
```
terraform 0.15upgrade
terraform apply
```
