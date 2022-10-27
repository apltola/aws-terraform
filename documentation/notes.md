## network

- **VPC**
  - VPC (virtual private cloud) is a resource which allows you to group all of your network resources together
  - Each of our environments is gonna have their own VPC
  - within a VPC we're gonna have Subnets which are used to run our resources and give them the appropriate access they need to the internet
- **Internet Gateway**
  - Internet gateway is a resource which is used by our Subnets to accept connections from the public internet
- **NAT Gateway**
  - NAT gateway is used to give resources outbound access to the public internet
- **Public Subnets**
  - Public subnets are used to make resources available from the public internet
  - subnets are used for things such as our LoadBalancer
- **Private Subnets**
  - Public subnets are used to protect resources from the public internet (e.g. our database)
- **Availability zone**
  - A way of dividing regions up into separate zones so that if one of the zones goes down, the other zone can take over and handle all of the traffic
  - basically, a way to help against the risk of the service going down
  - it's good practice to always create your subnets in more than one availability zone
- **Route table**
  - Route table is a way of adding routes to a Subnet
  - It needs to be associated with a VPC by creating a 'route_table_association'

## ECS

- Container Definition template:
  - A json file which contains all the details of our container so AWS knows how to run it in production
    - Image registry & image tag
    - Memory to assign to it
    - Environment vars

## Load balancer

- Load balancer consists of three different groups:
  - Load balancer itself
  - Target groups
    - target group is a group of servers that the load balancer can forward requests to
    - in our case, the target group contains the ECS services
  - Listener
    - Listener is used to accept the requests to the load balancer
