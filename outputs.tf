#output "server-public-ip" {
#  value       = aws_instance.wordpress[*].public_ip
#  description = "Instance PublicIP"
#}

output "lb_dns_name" {
  description = "The DNS name of the load balancer."
  value       = concat(aws_lb.lb.*.dns_name, [""])[0]
}

output "public-subnet" {
  #  value       = aws_subnet.public_subnet[*].id
  #  description = "Public Subnet ID"
  value = {
    for subnet in aws_subnet.public_subnet :
    subnet.id => subnet.cidr_block
  }
}

output "private-subnet" {
  value       = aws_subnet.private_subnet[*].id
  description = "Private Subnet ID"
}

output "ami_value" {
  value = lookup(var.aws_amis, var.aws_region)
}

output "vpc_id" {
  description = "ID of project VPC"
  value       = aws_vpc.vpc.id
}