
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
  
  provisioner "remote-exec"  {
    

    connection {
      type = "ssh"
      host = "${aws_instance.web-1.public_ip}"
      user = "${var.ssh_user}"
      port = "${var.ssh_port}"
      private_key = "${file(var.key_path)}"
      agent = true

    }
    inline = [
      "echo hello aws!",
    ]
    
   
    
  }
 provisioner "remote-exec"{
      inline = [
        "echo this works!",
        "sudo yum update -y",
      ]
    }
  


}
