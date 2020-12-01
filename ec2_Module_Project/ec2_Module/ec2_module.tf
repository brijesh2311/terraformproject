
variable "amiid" {
	default = "ami-0528a5175983e7f28"
	
}
variable "sg_id" {}
variable "ec2_name" {}

resource "aws_instance" "terraformec2" {
  ami           = "${var.amiid}"
  instance_type = "t3.micro"
  key_name = "TrikamBrijeshFreepbx"
  vpc_security_group_ids = ["${var.sg_id}"]
  tags = {
    Name = "${var.ec2_name}"
  }
}