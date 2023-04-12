# <p align=center>Networking, DNS, & Content Delivery</p>   
---
 - AWS General Immersion Day: Network Basic
   - Create a VPC  
   To Create VPC we need to go to the VPC dashboard - [Create VPC](https://us-east-1.console.aws.amazon.com/vpc/home?region=us-east-1#CreateVpc:createMode=vpcWithResources)  
   Do not forget to choose appropriate AZ as per ours task  
     <img width="780" alt="image" src="https://user-images.githubusercontent.com/61629889/230961095-22cc5aa1-5277-47f5-922e-810204211ee6.png">  
   Rename it as *VPC-lab* and VPC-lab-subnet-public1-ap-northeast-2a as well to SubnetA.  

   - Create additional subnets  
   To create an additional subnet go to VPC dashboard - Subnets - [Create subnet](https://ap-northeast-2.console.aws.amazon.com/vpc/home?region=ap-northeast-2#CreateSubnet:)  
     > You have successfully created 1 subnet: subnet-098166dc5210eb322  
     <img width="537" alt="image" src="https://user-images.githubusercontent.com/61629889/230972441-064e26df-7fa3-46cd-9b85-7c066dd28372.png">
   - Edit the routing table  
   Tick on the SubnetC and press Actions - Edit route table association. Chose the VPC created earlier.  
     > Subnet (subnet-098166dc5210eb322) has been successfully associated with route table (rtb-067d9c7750c2866cc).  
     <img width="856" alt="image" src="https://user-images.githubusercontent.com/61629889/230978559-b75d31b5-cd01-4b5d-ae48-4acabd3ce9c8.png">

   - Create a Security Group  
   To create SG we need to go EC2 - Network & Security - Security Groups - [Create security group](https://ap-northeast-2.console.aws.amazon.com/ec2/home?region=ap-northeast-2#CreateSecurityGroup:)  
   Lets find out our ip:
     ```bash
      EPBYMINW0E7F:~ Vitali_Kuts$ curl ifconfig.me
      195.56.119.209EPBYMINW0E7F:~ Vitali_Kuts$    
      ```  
     Security group (sg-063ceb36c02875ac1 | webserver-sg) was created successfully
     <img width="1296" alt="image" src="https://user-images.githubusercontent.com/61629889/231520887-2d2f41b7-c40a-4d97-b7db-28ce143cce04.png">

   - VPC Flow Logs (Optional)  
     1. CloudFormation  
     Go to CloudFormation - [Create stack](https://ap-northeast-2.console.aws.amazon.com/cloudformation/home?region=ap-northeast-2#/stacks/create) - Upload a template [file](https://static.us-east-1.prod.workshops.aws/public/cac296d5-3f05-4100-9bf2-a23b7eabd9f6/static/common/vpc/vpc-flow-logs.yml). 
     Name this stack as *KVA-VPC-Flow-Logs*, pick *VPC-lab*, and *SubnetA* as Public Subnet  
      <img width="966" alt="image" src="https://user-images.githubusercontent.com/61629889/231530400-7679a04f-3b82-4afc-b936-1d9d37aa1928.png">  
     2. Enable VPC Flow Logs  
     Go to VPC - Your VPCs - VPC-lab - Flow Logs - [Create flow log](https://ap-northeast-2.console.aws.amazon.com/vpc/home?region=ap-northeast-2#CreateVpcFlowLog:VpcId=vpc-02dedc3fec08b13dc)  
     <img width="776" alt="image" src="https://user-images.githubusercontent.com/61629889/231545154-39f8f9b8-c990-412f-b452-5c84841fa589.png">  
     > Successfully created flow log for vpc-02dedc3fec08b13dc. 
     
   - Clean up resources  

### <p align=center>Advanced level</p>   

 - Networking Immersion Day
 - Get Started Deploying Low Latency Applications with AWS Local Zones
 - Deploying your first 5G enabled application with AWS Wavelength
