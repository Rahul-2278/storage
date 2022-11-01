variable "vpc_id" {
  type  = string
}

variable "publicsubnet_cidr_block_a" {
  type = string
}

variable "publicsubnet_az_a" {
  type = string
}

variable "publicsubnet_tag_a" {
    type = string
}

variable "privatesubnet_cidr_block_a" {
  type = string
}

variable "privatesubnet_az_a" {
  type = string
}

variable "privatesubnet_tag_a" {
    type = string
}


variable "igw_tag_a" {
    type = string
}

variable "ngw_tag_a" {
    type = string
}