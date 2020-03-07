variable "instance_type" {
    default = "t2.micro"
}

variable "aws_region"{
    default = "us-gov-west-1"
}

variable "subnet_id" {
    description = "Subnet to place this instance"
}

variable "vpc_id" {
    description = "Vpc id to assign to this instance"
}

variable "key_name" {
    description = "SSH Key name to associate to this instance"
}