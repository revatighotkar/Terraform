variable "Aws_region" {
  type = string

}
variable "cidr_block1" {




}


variable "cidr_block2" {



}

variable "cidr_block3" {


}

variable "cidr_block4" {
  description = "CIDR blocks allowed for SSH"
  type        = list(string)
  
}


variable "key_name" {
  type        = string
  description = "The name of the key pair to use for the EC2 instance"

}

variable "availability_zone1" {
  type = string


}

variable "availability_zone2" {
  type = string
}

variable "ami_id" {
  type = string
}
variable "instance_type" {
  type    = string
  default = "t2.micro"
}