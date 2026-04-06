# Learning Terraform
This is the repository for the LinkedIn Learning course Learning Terraform. The full course is available from [LinkedIn Learning][lil-course-url].


### Instructor

Josh Samuelson 
                            
DevOps Engineer  

Check out my other courses on [LinkedIn Learning](https://www.linkedin.com/learning/instructors/josh-samuelson).

[lil-course-url]: https://www.linkedin.com/learning/learning-terraform-15575129?dApp=59033956
[lil-thumbnail-url]: https://cdn.lynda.com/course/3087701/3087701-1666200696363-16x9.jpg

## Architecture Diagram

The diagram below shows the main resources deployed by this Terraform code (VPC, subnets, NAT/IGW, security group, Application Load Balancer, target group, and an autoscaling group of EC2 instances using a queried AMI).

```mermaid
graph LR
	subgraph VPC [VPC]
		subgraph Public[Public Subnets]
			ALB[Application Load Balancer]
			ASG[Auto Scaling Group]
			EC2[EC2 Instances]
		end
		subgraph Private[Private Subnets]
			NotePrivate[(Private subnets)]
		end
	end

	Internet((Internet)) -->|HTTP/HTTPS| ALB
	ALB -->|forwards to| TG["Target Group\n(aws_lb_target_group.blog)"]
	TG --> ASG
	ASG --> EC2

	ALB -.-> SG[Security Group]
	ASG -.-> SG

	NAT[NAT Gateway] -.-> Private
	IGW[Internet Gateway] -.-> Public

	AMI[["AMI (data source)"]] --> ASG

	classDef infra fill:#e6f4ff,stroke:#0366d6,stroke-width:1px,color:#0b3d91;
	class VPC,ALB,ASG,EC2,SG,TG,IGW,NAT,AMI infra;
```

This is a high-level architecture diagram derived from the modules used in `main.tf` (VPC, security-group, alb, autoscaling). Adjust as needed for environment-specific details.
