  variable "ssh_public_key_filepath" {
    description 	= "File path for the ssh public key"
    type 		= "string"
    default 		= "ubuntu.pub"
  }

  variable "install_files_path" {
    description		= "Install files for deploying scripts to instance. Could be a S3 bucket or terraform config location"
    default		= "./"
  }


  variable "region" {
    description 	= "GCP region as listed in https://cloud.google.com/compute/docs/regions-zones/#available"
  }

  variable "zone" {
    description 	= "GCP zone as listed in https://cloud.google.com/compute/docs/regions-zones/#available"
  }

  variable "project_id" { 
    description 	= "GCP project ID"
  }

  variable "machine_type" { 
    description = "Machine type for Qlik Sense deployment"
  }

  variable "boot_disk_size_size" {
    description 	= "Boot disk size. Minimum 50GB for Win2016 image"
    default 		= "50"      
  } 

  variable "boot_disk_size_type" {
    description 	= "Boot disk type. pd-standard or pd-ssd, for HDD or SSD"
    default 		= "pd-ssd"
  }

  variable "windows_admin_user" {
    description 	= "Local Windows administrator"
    default 		= "admin"   
  }

  variable "winrm_timeout" {
    default 		= "10m"
  }

  variable "windows_pwd_special_chars" {
    description 	= "Special characters allowed in Windows password policy"
    default 		= "~!@#%^&*_-+=|(){}[]:;'<>.?"
  }


  variable "INSTANCE_USERNAME" {
  default = "Terraform"
}
  variable "INSTANCE_PASSWORD" { }
