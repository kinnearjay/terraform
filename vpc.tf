/*
sets up the default virtual private cloud 
*/

resource "aws_vpc" "defaultvpc" {
    cidr_block = "${var.vpc_cidr}"  //variable for the vpc cidr block located in variables.tf (not on github for security reasons)
    enable_dns_hostnames = true
    

    tags = {
        Name = "terraform-aws-vpc_qa"
    }
  
}
