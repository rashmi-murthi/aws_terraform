resource "aws_instance" "web_server" {
  ami             = var.ami
  instance_type   = var.instance_type
  security_groups = var.security_groups
  tags = {
    Name = "web-server"
  }
}
#New key pair
/* resource "aws_key_pair" "new_key" {
   key_name = var.key_name
   public_key = file(var.public_key_path)
 }*/