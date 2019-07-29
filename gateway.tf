/*
this file sets up the internet gateway for the public subnet
*/
resource "aws_internet_gateway" "defaultgw" {
    vpc_id= "${aws_vpc.defaultvpc.id}"  //assigns the gateway to the vpc located in vpc.tf file
    tags = {
        Name = "qa Gateway"
    }
  
}
