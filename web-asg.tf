resource "aws_autoscaling_group" "web-asg" {
  name                      = "web-asg"
  max_size                  = 1
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 1
  force_delete              = true
  #placement_group           = aws_placement_group.test.id
  launch_configuration      = aws_launch_configuration.web_launch_config.id
  vpc_zone_identifier       = [aws_subnet.pubsubnet-1.id, aws_subnet.pubsubnet-2.id]
  tag {
    key                 = "Name"
    value               = "web-asg-tf"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group" "apps-asg" {
  name                      = "apps-asg"
  max_size                  = 1
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 1
  force_delete              = true
  #placement_group           = aws_placement_group.test.id
  launch_configuration      = aws_launch_configuration.apps_launch_config.id
  vpc_zone_identifier       = [aws_subnet.pubsubnet-1.id, aws_subnet.pubsubnet-2.id]
  tag {
    key                 = "Name"
    value               = "apps-asg-tf"
    propagate_at_launch = true
  }
}


resource "aws_autoscaling_attachment" "asg_attachment_elb" {
  autoscaling_group_name = aws_autoscaling_group.web-asg.id
  lb_target_group_arn = aws_lb_target_group.demo-tg-1.arn
}

resource "aws_autoscaling_attachment" "asg_attachment_elb-1" {
  autoscaling_group_name = aws_autoscaling_group.apps-asg.id
  lb_target_group_arn = aws_lb_target_group.demo-tg-2.arn
}