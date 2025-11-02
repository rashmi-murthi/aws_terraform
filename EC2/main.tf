resource "aws_instance" "web_server" {
  ami             = var.ami
  instance_type   = var.instance_type
  security_groups = var.security_groups
  tags = {
    Name = "web-server"
  }
  user_data = file("install-nginx.sh")
}
#New key pair
/* resource "aws_key_pair" "new_key" {
   key_name = var.key_name
   public_key = file(var.public_key_path)
 }*/
 resource "aws_eip" "web_eip" {
  instance = aws_instance.web_server.id
  domain   = "vpc" 
}