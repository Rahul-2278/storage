resource "aws_vpc" "gujarat" {
  cidr_block           = var.vpc_cidr_block_a
  instance_tenancy     = "default"
  tags = {
    Name = var.vpc_tag_a
  }
}
