
variable "instance_type" {
	default = "t3.micro"
	type = string
}

variable "instance_block_storage" {
        default = 15
	type = number
}

variable "instance_ami_id" {
        default = "ami-0cfde0ea8edd312d4" #ubuntu
	type = string
}

variable "security_group_name" {
	default = "ec2_tf_sg"
	type = string

}

variable "instance_name" {
        default = "ec2_tf_sgec2_tf_sg"
        type = string

}
