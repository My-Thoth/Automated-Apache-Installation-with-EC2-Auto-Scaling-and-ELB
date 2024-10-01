output "elb_dns_name" {
  description = "The DNS name of the load balancer"
  value       = aws_lb.apache_lb.dns_name
}

output "autoscaling_group_name" {
  description = "The name of the Auto Scaling group"
  value       = aws_autoscaling_group.apache_asg.name
}
