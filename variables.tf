#############
# Instances #
#############

variable "aws_region" {
  description = "Region where to deploy the Nextcloud application and the database"
  default = "us-gov-west-1"
}

variable "nextcloud_instance_type" {
    description = "Instance type for the Nextcloud application"
    default = "m4.large"
}

variable "nextcloud_key_name" {
    description = "SSH key name to associate to the Nextcloud app instance"
    default = "nextcloud-initial"
}

variable "db_instance_type" {
  description = "Database instance type"
  default = "db.t2.micro"
}


###########
# Network #
###########

variable "vpc_cidr" {
  description = "CIDR of the VPC"
  default = "10.101.0.0/16"
}

variable "nextcloud_cidr" {
  description = "CIDR of the public subnet"
  default = "10.101.1.0/24"
}

variable "db_cidr" {
  description = "CIDR of the private subnet"
  default = "10.101.10.0/24"
}





############
# Database #
############
variable "db_user" {
  description = "Nextcloud database root user"
}

variable "db_pass" {
  description = "Nextcloud database root password"
}


#############
# Nextcloud #
#############

variable "admin_user" {
  description = "Nextcloud admin user"
}

variable "admin_pass" {
  description = "Nextcloud admin password"
}

################
# S3 datastore #
################

variable "s3_bucket_name" {
  description = "Name of the S3 bucket to use as datastore"
  default = "nextcloud-datastore"
}

variable "force_datastore_destroy" {
  description = "Destroy all objects so that the bucket can be destroyed without error. These objects are not recoverable"
  default = false
}


###############################
# EXISTING CTI INFRASTRUCTURE #
###############################

variable "cti_secure_vpc" {
  default = "vpc-dc8c93be"
}

variable "cti_prod_subnet" {
  default = "subnet-d98791bb"
}

variable "cti_full_sophos_sg" {
  default = "sg-0bee186e"
}