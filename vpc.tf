resource "aws_vpc" "defaultvpc" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_hostnames = true
    

    tags = {
        Name = "terraform-aws-vpc_qa"
    }
  
}
