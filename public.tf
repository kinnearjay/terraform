resource "aws_subnet" "public-subnet-in-us-west-2" {
    vpc_id = "${aws_vpc.defaultvpc.id}"

    cidr_block="${var.public_subnet_cidr}"
    availability_zone = "us-west-2a"

    tags = {
        Name = "QA public subnet"
    }
  
}

resource "aws_route_table_association" "tableass" {
    subnet_id = "${aws_subnet.public-subnet-in-us-west-2.id}"
    route_table_id = "${aws_route_table.public-subnet-in-us-west-2.id}"
  
}
