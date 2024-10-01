resource "aws_autoscaling_group" "apache_asg" {
  launch_template {
    id      = aws_launch_template.apache_template.id
    version = "$Latest"
  }
  
  vpc_zone_identifier = var.subnet_ids
  min_size            = 1
  max_size            = 3
  desired_capacity    = 1

  target_group_arns   = [aws_lb_target_group.apache_tg.arn]

  tag {
    key                 = "Name"
    value               = "Apache-Server"
    propagate_at_launch = true
  }

  health_check_type         = "EC2"
  health_check_grace_period = 300
}
