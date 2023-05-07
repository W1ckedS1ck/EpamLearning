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
Prerequisites:
Download the "S3-General-ID-Lab.yaml" CloudFormation template and apply it.
<img width="793" alt="image" src="https://user-images.githubusercontent.com/61629889/236691592-66fd8cb7-07ce-41b6-aadb-3c962b160fe9.png">  
Result will be like this.  
<img width="947" alt="image" src="https://user-images.githubusercontent.com/61629889/236691757-a9164bbf-208d-43b5-b531-01e4da6dd95b.png">
 - Creating a bucket in S3  
   Go to [S3](https://s3.console.aws.amazon.com/s3/buckets?region=us-east-1) and press Create bucket. Leave the settings as is, put a neme of is as kva-s3-lab. 
 - Adding objects to your S3 bucket  
   To add filen al we need to press upload. Upload our files except V2 folder.
   <img width="633" alt="image" src="https://user-images.githubusercontent.com/61629889/236692515-133c0b27-30fe-46d1-bc75-29637c5e74eb.png">
 - Working with objects in the S3 console  
   The S3 console gives you many familiar file system commands. You can rename, move, copy, delete, and view; to name a few. You also the have the ability to create a folder (also known as a "prefix"), add or remove metadata, edit the storage class and copy the S3 URI or URL of the object.
 - Accessing objects stored in S3  
   - Creating IAM Role for your EC2 Instance
     Go to "IAM" - Roles - Create role - AWS service, s3
     Next, we will create a permission policy for our role. A permission policy defines what actions the role can take and what resources the role can use. Click on Create Policy.
     a. Under "Service" select the Choose a service link. Type S3 in the search field and then select S3.
     b. Under "Actions" type GetObject in the "Filter actions" search. Put a check in the box next to "GetObject" only. Name this policy as KVA-EC2-S3-Access
     > Policy KVA-EC2-S3-Access created.
     Get back to KVA-EC2-S3-Access role and attach this policy to it.
     > Role KVA-EC2-S3-Access created.
   - Attach your new role to your EC2 instance  
     Go to EC2. Right-click on your instance, select Security and then Modify IAM Role.
     > Successfully attached KVA-EC2-S3-Access to instance i-044be584f474fb056
 - Enabling bucket versioning  
 - Setting up a Lifecycle Policy  
 - Cleanup: Deleting the objects and the S3 bucket  

### Create And Mount An Amazon EFS File System
### Amazon EFS Backup & Restore Using AWS Backup
### Configuring A Static Website Using A Custom Domain Registered With Route 53
