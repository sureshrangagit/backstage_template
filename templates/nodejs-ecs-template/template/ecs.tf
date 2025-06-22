resource "aws_ecs_cluster" "main" {
  name = "${var.service_name}-cluster"
}

resource "aws_ecs_task_definition" "node_service" {
  family                   = "${var.service_name}-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  container_definitions = jsonencode([
    {
      name      = "${var.service_name}-container"
      image     = "${var.docker_image}"
      essential = true
      portMappings = [
        {
          containerPort = 3001
          hostPort      = 3001
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "node_service" {
  name            = "${var.service_name}-svc"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.node_service.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets         = ["subnet-0b5212a9e2776be68", "subnet-0a7bdc84674cdb40d"]
    assign_public_ip = true
    security_groups = ["sg-03b86e4456c01d6dc"]
  }
}
