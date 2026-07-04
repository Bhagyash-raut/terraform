# Development Application Load Balancer
resource "aws_lb" "dev" {
  name               = "terraform-dev-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group_id]
  subnets            = var.subnet_ids

  enable_deletion_protection = false

  tags = {
    Name        = "terraform-dev-alb"
    Environment = "dev"
  }

  lifecycle {
     prevent_destroy = true
  }
}

# Dev Target Group
resource "aws_lb_target_group" "dev" {
  name     = "terraform-dev-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_subnet.selected.vpc_id

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 30
    path                = "/"
    matcher             = "200"
  }

  tags = {
    Name        = "terraform-dev-tg"
    Environment = "dev"
  }
}

# Dev Load Balancer Listener
resource "aws_lb_listener" "dev" {
  load_balancer_arn = aws_lb.dev.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.dev.arn
  }
}

# Data source to get VPC ID from subnet
data "aws_subnet" "selected" {
  id = var.subnet_ids[0]
}
