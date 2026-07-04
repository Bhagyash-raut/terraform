resource "aws_launch_template" "example0" {
  name_prefix   = "terraform-asg-"
  image_id      = var.ami_id
  instance_type = var.instance_type
  user_data     = filebase64("${path.module}/userdata.sh")
  vpc_security_group_ids = [var.security_group_id]

  lifecycle {
     ignore_changes = [user_data, vpc_security_group_ids]
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name        = "DevelopmentInstance"
      Environment = "dev"
    }
  }
}

resource "aws_autoscaling_group" "example0" {
  name                      = "terraform-dev-asg"
  min_size                  = var.asg_min_size
  max_size                  = var.asg_max_size
  desired_capacity          = var.asg_desired_capacity
  vpc_zone_identifier       = var.subnet_ids
  target_group_arns         = [aws_lb_target_group.dev.arn]
  force_delete              = true
  health_check_type         = "ELB"
  health_check_grace_period = 300

 # precondition {
  #  condition     = var.asg_min_size <= var.asg_desired_capacity && var.asg_desired_capacity <= var.asg_max_size
   # error_message = "ASG sizes must satisfy min_size <= desired_capacity <= max_size."
  #}

  launch_template {
    id      = aws_launch_template.example0.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "terraform-dev-asg-instance"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "dev"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "cpu_target" {
  name                   = "asg-cpu-target-tracking"
  autoscaling_group_name = aws_autoscaling_group.example0.name
  policy_type            = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value     = 50.0
    disable_scale_in = false
  }
}

#terraform state list | grep aws_autoscaling_group
