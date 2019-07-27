resource "aws_ebs_volume" "extravolume-1" {
  availability_zone = "${var.availability_zone}"
  size = 10

  tags = {
      Name = "ebs volume"
  }
}
