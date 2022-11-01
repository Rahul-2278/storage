#--------------------- ec2 variable ------------------

variable "public_ami_id" {
    type = string
}

variable "private_ami_id" {
    type = string
}

variable "public_instance_type" {
    type = string
}

variable "private_instance_type" {
    type = string
}

variable "key_name" {
    type = string
}

variable "public_instance_tag" {
    type = string
}

variable "private_instance_tag" {
    type = string
}

#-------------------security group variable------------

variable "sg_name" {
    type = string
}

#----------------------subnet variable-----------

variable "publicsubnet_cidr_block" {
  type = string
}

variable "publicsubnet_az" {
  type = string
}

variable "publicsubnet_tag" {
    type = string
}

variable "privatesubnet_cidr_block" {
  type = string
}

variable "privatesubnet_az" {
  type = string
}

variable "privatesubnet_tag" {
    type = string
}


variable "igw_tag" {
    type = string
}

variable "ngw_tag" {
    type = string
}

#--------------------vpc variable --------------

variable "vpc_cidr_block" {
  type = string
}

variable "vpc_tag" {
    type = string
}