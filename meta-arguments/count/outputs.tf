output "instance_public_ip" {
        value = aws_instance.my_instance[*].public_ip # this will get pubic ip for the count meta argument
}

output "instance_public_dns" {
        value = aws_instance.my_instance[*].public_dns # this will get pubic ip for the count meta argument
}

output "instance_private_ip" {
        value = aws_instance.my_instance[*].private_ip # this will get pubic ip for the count meta argument
}
