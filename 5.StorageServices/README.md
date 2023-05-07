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
   Go [here](https://ap-northeast-2.console.aws.amazon.com/efs/home?region=ap-northeast-2#/file-systems) and create customized EFS with defaulf params except Encryption (UNCHECK) and Throughput mode = Bursting. Network access - chose appropriate VPC and SG.
    > File system (fs-063c04df3d171bb1b) is available.
 - Create the first EC2 Instance and Mount our EFS drive
  Go to EC2 and create 1 instance. Name it as **EFS-SERVER-1**. Leave all settings as defaults, but do not forget to attach VPC and first subnet. Select existing security group and pick SGforEFS.  
  In Storage (volumes) pick our EFS, and uncheck "Automatically create and attach security groups" option.
   > Successfully initiated launch of instance (i-0bc64cf993e59149c)
 - Create the second EC2 Instance and Mount our EFS drive
   Lets do as we did EFS-SERVER-1 before. Name it as **EFS-SERVER-2**. Subnet should be different - select Public Subnet 2. Auto-Assign Public IP - ENABLED.
    > Successfully initiated launch of instance (i-097289e0a061aff7c)
 - Connect to both EC2 instances using Instance Connect
   To connect to our 2 EC2 just go to EC2 tab and press CONNECT.
 - Create a file on EFS drive.  
   <img width="460" alt="image" src="https://user-images.githubusercontent.com/61629889/236685919-bb7c4339-bb3c-4693-9f7e-48577007eed8.png">
 - Demonstrate the EFS mount from the second instance  
   <img width="471" alt="image" src="https://user-images.githubusercontent.com/61629889/236685886-e08a7cd5-1473-4ff2-beac-daf44b5c816e.png">
- Clean up  
  - Delete EFS ✅
  - Delete EC2s ✅
  - Delete VPC ✅
  - Delete Subnets ✅
#### Let's get started: S3 Hands-On Lab


### Create And Mount An Amazon EFS File System
### Amazon EFS Backup & Restore Using AWS Backup
### Configuring A Static Website Using A Custom Domain Registered With Route 53
