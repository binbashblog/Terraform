1) In AWS > IAM > New user for Terraform > terraform-user > AWS access type > Programmatic access > administrator access > Review > Create user
Access key ID and Secret access key is generated

2) install AWS CLI
curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
unzip awscli-bundle.zip
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

3) 
echo $PATH | grep ~/bin     // See if $PATH contains ~/bin (output will be empty if it doesn't)
export PATH=~/bin:$PATH     // Add ~/bin to $PATH if necessary

4) type in AWS configure

5) Enter access key
6) Enter Secret Key

7) Region - us-west-2

8) None (json is default)

9) Download Terraform binary:

`wget https://releases.hashicorp.com/terraform/0.12.1/terraform_0.12.1_linux_amd64.zip`

`unzip terraform_0.12.1_linux_amd64.zip -d /usr/local/bin`

2) Verify you can run terraform:

`terraform -v`

10) unzip terraform to /usr/local/bin so it will add it to your path, chmod +x terraform

11) terraform --version

12) Git clone the code

13) Keep the variables.secret.tf file out of GIT by adding it to .gitignore

14) Adjust the tf files to your AWS environment

15) Run the terraform commands to verify the tf files are valid

`terraform init`
`terraform plan`

16) Build and destroy:

`terraform apply`
`terraform destroy`




 Run the terraform commands to verify everything is working
