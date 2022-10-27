resource "aws_lb" "api" {
  name               = "${local.prefix}-main"
  load_balancer_type = "application" # application load balancer handle requests at HTTP/HTTPS level
  subnets = [
    aws_subnet.public_a.id, # this load balancer should exist in the public subnets, because we want it to be accessible by the public internet
    aws_subnet.public_b.id
  ]

  security_groups = [aws_security_group.lb.id]

  tags = local.common_tags
}

resource "aws_lb_target_group" "api" { # create a new target group and add all ECS tasks in our environment to this target group
  name        = "${local.prefix}-api"
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main.id # the target group needs to be in the same vpc as our application
  target_type = "ip"
  port        = 8000

  health_check {
    path = "/"
  }
}

resource "aws_lb_listener" "api" {
  load_balancer_arn = aws_lb.api.arn
  port              = 80
  protocol          = "HTTP"

  # this action forwards all the reuqests from our load balancer to the target group
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.api.arn
  }
}

resource "aws_security_group" "lb" {
  description = "Allow access to Application Load Balancer"
  name        = "${local.prefix}-lb"
  vpc_id      = aws_vpc.main.id

  ingress { # ingress accepts requests from public internet to our load balancer
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress { # egress is the access our load balancer has to our application
    protocol    = "tcp"
    from_port   = 8000
    to_port     = 8000
    cidr_blocks = ["0.0.0.0/0"]
  }
}