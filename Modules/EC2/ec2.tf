resource "aws_instance" "public_instance" {
    ami = var.public_ami_id_a
    instance_type = var.public_instance_type_a
    key_name = var.key_name_a
    subnet_id = var.private_subnet_a
    security_groups = [var.sg]
    tags = {
    Name = var.public_instance_tag_a
    }
 }

 resource "aws_instance" "private_instance" {
    ami = var.private_ami_id_a
    instance_type = var.private_instance_type_a
    key_name = var.key_name_a
    subnet_id = var.private_subnet
    security_groups = [var.sg]
    tags = {
    Name = var.private_instance_tag_a
    }
 }