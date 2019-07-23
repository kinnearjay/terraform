
resource "aws_instance" "web-1" {
  ami="${var.aminame}"
  availability_zone= "us-west-2a"
  instance_type = "t2.micro"
  key_name= "${var.key_name}"
  vpc_security_group_ids=["${aws_security_group.web.id}"]
  subnet_id= "${aws_subnet.public-subnet-in-us-west-2.id}"
  associate_public_ip_address = true
  source_dest_check = false
  tags = {
      Name= "qawebserver"
  }
  /*
  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y"
    ] 
    connection {
      host = "${aws_instance.web-1.public_ip}"
      private_key = "${var.key_name}"
      port = 22
      type = "ssh"
      user = "ec2-user"
      password= ""
      
    } 
  }
*/
  


}

