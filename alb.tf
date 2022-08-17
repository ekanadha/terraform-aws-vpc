

resource "aws_lb" "alb-demo2" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.alb-sg.id}"]
  subnets = ["subnet-01d97bd66f8b422a2", 
              "subnet-064ff4b0fd7e60dca",
              "subnet-0cde2fc4a88e30567"]
}              

resource "aws_lb_target_group" "demo-tg-1" {
  name     = var.tg_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id
}

resource "aws_lb_target_group" "demo-tg-2" {
  name     = var.tg_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id
}

resource "aws_lb_target_group_attachment" "demo-alb" {
  target_group_arn = aws_lb_target_group.demo-tg-1.arn
  target_id        = aws_instance.apps.id
  port             = 80
 
}

resource "aws_lb_target_group_attachment" "demo-alb-1" {
  target_group_arn = aws_lb_target_group.demo-tg-2.arn
  target_id        = aws_instance.apps.id
  port             = 80
 
}

resource "aws_lb_listener" "demo-listener" {
  load_balancer_arn = aws_lb.alb-demo2.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.demo-tg-1.arn
  }
}

resource "aws_lb_listener" "demo-listener-1" {
  load_balancer_arn = aws_lb.alb-demo2.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.demo-tg-2.arn
  }
}



# resource "aws_lb" "alb-demo3" {
#   name               = var.alb_name
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = ["${aws_security_group.alb-sg.id}"]
#   subnets = ["subnet-0c735ba7d42c9ab21", 
#              "subnet-0c8f287c747288e95",
#              "subnet-0f3b079897a77d395"]
# }              

# resource "aws_lb_target_group" "demo-tg-2" {
#   name     = var.tg_name
#   port     = 80
#   protocol = "HTTP"
#   vpc_id   = aws_vpc.vpc.id
# }

# resource "aws_lb_target_group_attachment" "demo-alb" {
#   target_group_arn = aws_lb_target_group.demo-tg-2.arn
#   target_id        = aws_instance.web.id
#   port             = 80

 
# }



# resource "aws_lb_listener" "demo-listener" {
#   load_balancer_arn = aws_lb.alb-demo3.arn
#   port              = "80"
#   protocol          = "HTTP"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.demo-tg-2.arn
#   }
# }