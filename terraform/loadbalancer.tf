resource "aws_lb" "apache_lb" {
  name               = "apache-loadbalancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.elb_sg.id]
  subnets            = var.subnet_ids
}

resource "aws_lb_target_group" "apache_tg" {
  name     = "apache-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_listener" "apache_listener" {
  load_balancer_arn = aws_lb.apache_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.apache_tg.arn
  }
}
