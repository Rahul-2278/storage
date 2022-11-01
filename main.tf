module "vpc" {
    source = "./Modules/VPC"
    vpc_cidr_block_a = var.vpc_cidr_block
    vpc_tag_a = var.vpc_tag
  
}


module "subnet" {
  source = "./Modules/Subnet"
  vpc_id = module.vpc.vpc_id
  publicsubnet_cidr_block_a = var.publicsubnet_cidr_block
  publicsubnet_az_a = var.publicsubnet_az
  publicsubnet_tag_a = var.publicsubnet_tag
  privatesubnet_cidr_block_a = var.privatesubnet_cidr_block
  privatesubnet_az_a = var.privatesubnet_az
  privatesubnet_tag_a = var.privatesubnet_tag
  igw_tag_a = var.igw_tag
  ngw_tag_a = var.ngw_tag


}

module "security_group" {
  source = "./Modules/Security_Group"
  sg_name_a = var.sg_name
  vpc_id = module.vpc.vpc_id
  vpc_cidr_block_a = var.vpc_cidr_block

}

module "ec2" {
  source = "./Modules/EC2"
  public_subnet_a = module.subnet.public_subnet
  private_subnet = module.subnet.private_subnet
  sg = module.security_group.sg
  public_ami_id_a = var.public_ami_id
  private_ami_id_a = var.private_ami_id
  public_instance_type_a = var.public_instance_type
  private_instance_type_a = var.private_instance_type
  key_name_a = var.key_name
  public_instance_tag_a = var.public_instance_tag
  private_instance_tag_a = var.private_instance_tag
  



  
}


    
