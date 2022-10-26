resource "aws_ecs_cluster" "main" {
  name = "${local.prefix}-cluster" # 1 cluster per environment

  tags = local.common_tags
}

resource "aws_iam_policy" "task_execution_role_policy" {
  name        = "${local.prefix}-task-exec-role-policy"
  path        = "/"
  description = "Allow retrieving of images and adding to logs"
  policy      = file("./templates/ecs/task-exec-role.json")
}

resource "aws_iam_role" "task_execution_role" {
  name               = "${local.prefix}-task-exec-role"
  assume_role_policy = file("./templates/ecs/assume-role-policy.json")

  tags = local.common_tags
}

resource "aws_iam_role_policy_attachment" "task_execution_role" {
  role       = aws_iam_policy.task_execution_role_policy.name
  policy_arn = aws_iam_policy.task_execution_role_policy.arn
}

resource "aws_iam_role" "app_iam_role" {
  name               = "${local.prefix}-task"
  assume_role_policy = file("./templates/ecs/assume-role-policy.json")

  tags = local.common_tags
}

resource "aws_cloudwatch_log_group" "ecs_task_logs" {
  name = local.prefix

  tags = local.common_tags
}

# Pull in the container-definitions template file and populate it with values
data "template_file" "api_container_definitions" {
  template = file("./templates/ecs/container-definitions.json.tpl")

  vars = {
    "app_image"        = var.ecr_image_api
    "allowed_hosts"    = "*"
    "log_group_name"   = aws_cloudwatch_log_group.ecs_task_logs.name
    "log_group_region" = data.aws_region.current.name
  }
}

resource "aws_ecs_task_definition" "api" {
  family                   = local.prefix                                          # family is the name of task definition
  container_definitions    = data.template_file.api_container_definitions.rendered # this received our rendered container definitions template file
  requires_compatibilities = ["FARGATE"]                                           # Fargate is a type of ECS hosting which allows us to host containers without managing servers
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = aws_iam_role.task_execution_role.arn
  task_role_arn            = aws_iam_role.app_iam_role.arn
  volume {
    name = "static"
  }

  tags = local.common_tags
}
