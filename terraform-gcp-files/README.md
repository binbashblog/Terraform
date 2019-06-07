1) Download Terraform binary:

`wget https://releases.hashicorp.com/terraform/0.12.1/terraform_0.12.1_linux_amd64.zip`

`unzip terraform_0.12.1_linux_amd64.zip -d /usr/local/bin`

2) Verify you can run terraform:

`terraform -v`

3) Download Google Cloud SDK:

`curl https://sdk.cloud.google.com | bash`
Move to /usr/local/bin and/or set your PATH if needed

4) Initialize the gcloud environment:

`gcloud init`


5) Create a project in GCP

6) Create a Service Account with the compute admin role and download the JSON file. Keep thid JSON file safe, do not store it in your GIT repository, put the JSON file name (terraform-account.json) in the .gitignore file to ensure this.

7) Amend the tf files in the repo to match your project, region, credentials file, etc

8) Run `terraform init`, this should verify the tf files are valid

9) Run `terraform plan` to see what terraform will do

10) Now `terraform apply`

11) Now you can run gcloud compute instances list to list the instances built by your terraform code

12) Run `terraform destroy` to destroy the instances

