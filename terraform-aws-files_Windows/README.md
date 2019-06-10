# Terraform with AWS and Windows Server 2019 Base

1) In AWS > IAM > New user for Terraform > terraform-user > AWS access type > Programmatic access > administrator access > Review > Create user
Access key ID and Secret access key is generated

2) In AWS go to > Networking > VPC > Security Groups > Change inbound rules > edit > add rule > ALL TCP > your_IP_Address > Save

3) 
echo $PATH | grep ~/bin     // See if $PATH contains ~/bin (output will be empty if it doesn't)
export PATH=~/bin:$PATH     // Add ~/bin to $PATH if necessary

4) Download Terraform binary:

`wget https://releases.hashicorp.com/terraform/0.12.1/terraform_0.12.1_linux_amd64.zip`

`unzip terraform_0.12.1_linux_amd64.zip -d /usr/local/bin`

Verify you can run terraform:

`terraform -v`

5) unzip terraform to /usr/local/bin so it will add it to your path, chmod +x terraform

6) terraform --version

7) Git clone the code

8) Keep the terraform.tfvars file out of GIT by adding it to .gitignore

9) Generate your ssh key by running "ssh-keygen -f mykey". Hit enter on the prompts.

10) Adjust the tf files to your AWS environment

11) Run the terraform commands to verify the tf files are valid

`terraform init`
`terraform plan`

12) Build and destroy:

`terraform apply`
`terraform destroy`


# Run the terraform commands to verify everything is working, destroy immediately if you don't want to get a massive bill.

# You will be prompted to set the INSTANCE_PASSWORD when you do `terraform apply`, it will need to be complex, a mixture of leters and numbers and symbols, as per Microsoft's password complexity to work

# You can now further expand this by running puppet  or powershell commands to configure the instance.
