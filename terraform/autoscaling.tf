# autoscaling.tf

resource "aws_autoscaling_group" "my_asg" {
  launch_template {
    id      = aws_launch_template.my_launch_template.id
    version = "$Latest"
  }

  min_size            = 1
  max_size            = 3
  desired_capacity    = 1
  vpc_zone_identifier = [aws_subnet.my_subnet_a.id, aws_subnet.my_subnet_b.id]

  tag {
    key                 = "Name"
    value               = "my-instance"
    propagate_at_launch = true
  }

  health_check_type          = "ELB"
  health_check_grace_period  = 300

  # Link to target group
  target_group_arns = [aws_lb_target_group.my_target_group.arn]  # Reference the target group
}
