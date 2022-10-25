# task-exec-role.json

This is a template file containing the ECS `task execution role`

This role is used for **starting a ECS service**

The task execution role allows our ECS task to:

- retrieve the image from ECR
- create a new logs stream
- push logs into the logs stream

# assume-role-policy.json

This policy will allow our ECS task to assume the `task execution role`
