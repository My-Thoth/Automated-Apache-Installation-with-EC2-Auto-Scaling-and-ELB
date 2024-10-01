output "elb_dns_name" {
  value = aws_lb.my_lb.dns_name
}

output "launch_template_id" {
  value = aws_launch_template.my_launch_template.id
}
