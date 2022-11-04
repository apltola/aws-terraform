## network

- **VPC**
  - VPC (virtual private cloud) is a resource which allows us to group all of your network resources together
  - Within a VPC we have Subnets, which are used to run our resources and give them the appropriate access to the internet
- **Internet Gateway**
  - Internet gateway is a resource used by our public Subnets to accept connections from the internet
- **NAT Gateway**
  - NAT gateway is used to give resources outbound access to the public internet
- **Public Subnets**
  - Public subnets are used to make resources available from the public internet
  - Subnets are used for resources such as our LoadBalancer, which will receive requests from the public internet
- **Private Subnets**
  - Private subnets are used to protect resources from the public internet (e.g. our database)
- **Availability zone**
  - Availability zone is way of dividing regions up into separate zones, so that if one of the zones goes down, an other zone can take over and handle all of the traffic
  - basically, az's are a way to mediate the risk of our service going down
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
