# Creating ECR 

resource "aws_ecr_repository" "foo" {
  name                 = "mwaiyee"
  image_tag_mutability = "MUTABLE"
  force_delete = true
  image_scanning_configuration {
    scan_on_push = false
  }
}


# Creating ecs cluster 
resource "aws_ecs_cluster" "cluster" {
  name = "mwaiyee-cluster"
}

# Creating service for cluster
resource "aws_ecs_service" "service" {
  name          = "hello-world"
  cluster       = aws_ecs_cluster.cluster.arn
  desired_count = 2
  launch_type   = "FARGATE"

  # Track the latest ACTIVE revision
  task_definition = aws_ecs_task_definition.service.arn

 network_configuration {
   subnets          = [var.subnet1, var.subnet2]
   assign_public_ip = true 
   security_groups  = [var.security_group]
 }
 load_balancer {
    target_group_arn = aws_lb_target_group.lb_target_group.arn
    container_name   = "hello-world"
    container_port   = 5000
  }
}

# Creating task definition
resource "aws_ecs_task_definition" "service" {
  family                   = "mwaiyee-service"
  execution_role_arn       = "arn:aws:iam::255945442255:role/ecsTaskExecutionRole"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 1024
  memory                   = 2048

  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "ARM64"
  }
  container_definitions = jsonencode([
    {
      name      = "hello-world"
      image     = "255945442255.dkr.ecr.us-east-1.amazonaws.com/mwaiyee:latest"
      cpu       = 10
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 5000
          protocol      = "tcp"
        }
      ]
    }
  ])

}

# Creating application load balancer
resource "aws_lb" "application_lb" {
  name               = "mwaiyee-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group]
  subnets            = [var.subnet1, var.subnet2]

  enable_deletion_protection = false

  tags = {
    Name = "mwaiyee"
  }
}

# Creating application target group
resource "aws_lb_target_group" "lb_target_group" {
  name     = "mwaiyee-tf-example-lb-nlb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  target_type = "ip"

  target_health_state {
    enable_unhealthy_connection_termination = false
  }
}

# Creating listener to forward traffic from loadbalancer to target group 
resource "aws_lb_listener" "ecs_alb_listener" {
 load_balancer_arn = aws_lb.application_lb.arn
 port              = 80
 protocol          = "HTTP"

 default_action {
   type             = "forward"
   target_group_arn = aws_lb_target_group.lb_target_group.arn
 }
}

