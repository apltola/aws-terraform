# Node API – Docker Terraform AWS

![aws graph](./documentation/infra.png)

## Local development

Run terraform with Docker Compose:

```
docker-compose -f deploy/docker-compose.yml run --rm terraform workspace new dev
docker-compose -f deploy/docker-compose.yml run --rm terraform init
docker-compose -f deploy/docker-compose.yml run --rm terraform fmt
docker-compose -f deploy/docker-compose.yml run --rm terraform validate
docker-compose -f deploy/docker-compose.yml run --rm terraform plan
docker-compose -f deploy/docker-compose.yml run --rm terraform apply
```

etc...

## Misc

Terraform AWS docs: https://registry.terraform.io/providers/hashicorp/aws/latest/docs
