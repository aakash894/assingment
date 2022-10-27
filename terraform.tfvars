ami           = "ami-08c40ec9ead489470"
instance_type = "t2.micro"
key_name      = "ansible"
tags_ec2 = {
  Name = "Nginx"
  Type = "webserver"
  version = "nubra"
}
ami_name = "Nginx ami"
