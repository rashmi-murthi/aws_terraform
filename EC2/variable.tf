variable "region" {
  default = "us-east-1"
  type    = string
}
variable "ami" {
  default = "ami-0c398cb65a93047f2"
  type    = string
}
variable "instance_type" {
  default = "t2.micro"
  type    = string
}
variable "security_groups" {
  default = ["admin-sg"]
  type    = list(string)
}
#New key pair 
/*variable "key_name" {
        default = "new-key"
        type = string
}
variable "public_key_path" {
  default = "/home/codespace/.ssh/id_rsa.pub"
       type = string
}*/