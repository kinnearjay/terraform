/*
this file contains the public subnet and information using varaibles from variables.tf file (not on the github for security reasons)
*/
// sets up public subnet  in us-west-2a 
resource "aws_subnet" "public-subnet-in-us-west-2" {
    vpc_id = "${aws_vpc.defaultvpc.id}"

    cidr_block="${var.public_subnet_cidr}"
    availability_zone = "us-west-2a"

    tags = {
        Name = "QA public subnet"
    }
  
}

//associates the route table with the  with the subnet allowing the subnet to access the internet
resource "aws_route_table_association" "tableass" {
    subnet_id = "${aws_subnet.public-subnet-in-us-west-2.id}"
    route_table_id = "${aws_route_table.public-subnet-in-us-west-2.id}"
  
}
