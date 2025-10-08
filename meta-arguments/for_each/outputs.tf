output "instance_public_ip" {
  value = [
    for key in aws_instance.my_instance : key.public_ip
  ]
}

output "instance_public_dns" {
  value = [
    for key in aws_instance.my_instance : key.public_dns
  ]
}

output "instance_private_ip" {
  value = [
    for key in aws_instance.my_instance : key.private_ip
  ]
}


