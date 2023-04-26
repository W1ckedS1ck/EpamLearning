# <p align=center>Storage Services</p>   
***  
### AWS General Immersion Day: S3 Basic
#### Let's get started: Amazon EFS Hands-On Lab
 - Create a Virtual Private Cloud (VPC) with two Public Subnets  
   Ok, go to VPC - Create VPC. Name it as *VPCforEFS* and leave all as is except *Number of private subnets* = 0 and *VPC endpoints* - NONE
   > vpc-0dffe659c2125c22f / VPCfor EFS-vpc
 - Create Security Groups for EC2 and EFS  
   To create a SG navigate to EC2 - Network & Security - Security Groups.  
   Now let's create two security groups, one for the EC2 instances to allow us to connect to it and one to allow the EC2 to connect to the Elastic File System (EFS).
    - Name one of them *SGforEC2*. Chose *VPCforEFS* as VPC and set *Inbound rules* to able to connect via ssh.  
    - Next one will be *SGforEFS*. Type of Inbound rules = EFS, and SG = SGforEC2. After creating the security group press *Edit* and add SG = SGforEFS to grant access to itself.   
 - Create an Elastic File system (EFS)
 - Create the first EC2 Instance and Mount our EFS drive
 - Create the second EC2 Instance and Mount our EFS drive
 - Connect to both EC2 instances using Instance Connect
 - Create a file on EFS drive
 - Demonstrate the EFS mount from the second instance
 - Clean up
#### Let's get started: S3 Hands-On Lab




### Create And Mount An Amazon EFS File System
### Amazon EFS Backup & Restore Using AWS Backup
### Configuring A Static Website Using A Custom Domain Registered With Route 53
