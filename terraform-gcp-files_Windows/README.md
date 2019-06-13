1) Download Terraform binary:

`wget https://releases.hashicorp.com/terraform/0.12.1/terraform_0.12.1_linux_amd64.zip`

`unzip terraform_0.12.1_linux_amd64.zip -d /usr/local/bin`

2) Verify you can run terraform:

`terraform -v`

3) Download Google Cloud SDK:

`curl https://sdk.cloud.google.com | bash`
Move to /usr/local/bin and/or set your PATH if needed

Or via your package manager, i.e for Ubuntu/Debian:
# Add the Cloud SDK distribution URI as a package source
`echo "deb http://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list`

# Import the Google Cloud Platform public key
`curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -`

# Update the package list and install the Cloud SDK
`sudo apt-get update && sudo apt-get install google-cloud-sdk`


4) Run `gcloud init` and follow instructions 

You can run gcloud commands to get things such as compute machine types and OS images, etc to use in your config e.g:

`gcloud compute machine-types list --filter="zone:(europe-west2-c) name~'standard'"`

`gcloud compute images list --filter="name~'ubuntu'"`

5) Create a project in GCP

6) Go to IAM & admin > Service Accounts. Create a Service Account (I called mine terraform) with the compute admin role and click CREATE KEY. Download the JSON file. Keep this JSON file safe, do not store it in your GIT repository, put the JSON file name (terraform-account.json) in the .gitignore file to ensure this.

7) Amend the tf files in the repo to match your project, region, credentials file, etc

8) Run `terraform init`, this should verify the tf files are valid

9) Run `terraform plan` to see what terraform will do

10) Now `terraform apply`

11) Now you can run gcloud compute instances list to list the instances built by your terraform code

12) Run `terraform destroy` to destroy the instances

Expand further with a script to configure the OS, the script could update the instance and then run puppet for instance.
