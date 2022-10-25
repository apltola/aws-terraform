resource "aws_ecs_cluster" "main" {
  name = "${local.prefix}-cluster" # 1 cluster per environment

  tags = local.common_tags
}