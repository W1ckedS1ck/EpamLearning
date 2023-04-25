# <p align=center>Compute Services</p>   
***  
### AWS General Immersion Day: Compute Basic
  #### 1. Elastic Compute Cloud - EC2 
  - Create a new key pair  
  To create a new key go to EC2 - Network & Security - Key Pairs - [Create key pair](https://ap-northeast-2.console.aws.amazon.com/ec2/home?region=ap-northeast-2#CreateKeyPair:)  
    > Successfully created key pair
  - Launch a Web Server Instance  
  Go to EC2 and create inctance named Web server for IMD and attach key pair has been created before.
    > Successfully initiated launch of instance (i-0ea95eb282bff8e07)
    <img width="343" alt="image" src="https://user-images.githubusercontent.com/61629889/233382733-c15873db-a581-4d0d-bde9-a69b5ea065de.png">  
  - Connect to your linux instance  
    <img width="938" alt="image" src="https://user-images.githubusercontent.com/61629889/233378845-831268d7-6ebf-4b01-bd56-259a26ba2e20.png">     
  - Connect to your Linux instance using Session Manager (Optional)  
    > Will be added soon  
  - Connect to EC2 Instance using PuTTy (Optional)  
    <img width="505" alt="image" src="https://user-images.githubusercontent.com/61629889/233379748-d90057dc-1dd8-4213-85aa-82dd4fde4580.png">  

#### 2. Amazon EC2 Auto Scaling with EC2 Spot Instances
  - Step 1: Create the Load Balancer and Security Group  
  To create a new key go to EC2 - Load Balancing - Load Balancers - [Create Load Balancer](https://ap-northeast-2.console.aws.amazon.com/ec2/home?region=ap-northeast-2#SelectCreateELBWizard:). Pick *Application Load Balancer*, Mappings - all accessible. Then create a new Security Group (i called it *SG-for-LB*) that allows all HTTP/80 traffic. Press reload button and pick SG-for-LB just created. In the Create target group window, leave the target type as Instances, specify a target group name(i called it *TG-for-LB*), and keep Protocol as HTTP on port 80, Healthy threshold = 2.  
    > Successfully created load balancer: LBforCloudX
  - Step 2: Create the launch template for the Amazon EC2 Auto Scaling group  
  Open the EC2 - Auto Scaling - Auto Scaling Groups - [Create Auto Scaling group](https://ap-northeast-2.console.aws.amazon.com/ec2/home?region=ap-northeast-2#CreateAutoScalingGroup:) pick *Launch template* - Create a launch template. Name it and fill *Launch template contents*. For this tutorial, select Amazon Linux 2 AMI (HVM), SSD Volume Type. Scroll down to Network settings and select the security group that was created for the Application Load Balancer. Expand the Advanced details - User data  
    ```bash
    #!/bin/bash
    yum install httpd -y 
    systemctl start httpd 
    systemctl stop firewalld 
    cd /var/www/html 
    echo "this is my test site and the instance-id is " > index.html curl http://169.254.169.254/latest/meta-data/instance-id >> index.html
    ```
    > Successfully created Template-for-EC2 (lt-0b1571b020010d234)
  - Step 3: Create the Amazon EC2 Auto Scaling group—launch template, instances, and network subnet selection  
  Get back to *Auto Scaling groups*, name it as **ASGforCloudX**, pick templete for EC2, change Version to *Latest* and press NEXT. Select VPC, all available Availability Zones, fill in *Specify instance attributes*, set *Instance purchase options* as 10% On-Demand and press NEXT.  
  - Step 4: Create the Amazon EC2 Auto Scaling group—load balancing and scaling policies  
  Load balancing - Attach to an existing load balancer - Choose from your load balancer target groups (we created it in a while ago) - Health check grace period = 120 Sec, press NEXT
  Configure group size and scaling policies - Set the Desired capacity to 12, the Minimum capacity to 6, and the Maximum capacity to 12.
  Target tracking scaling policy - set *Metric type* as 50% Average CPU utils, choose Create Auto Scaling group
    > ASGforCloudX, 1 Scaling policy created successfully
  - Step 5: Monitor and test the Auto Scaling group  
  Go to *Auto Scaling groups* - ASGforCloudX  
    <img width="527" alt="image" src="https://user-images.githubusercontent.com/61629889/234079198-70c00f00-5015-4de3-8320-0c3fb5c8de2c.png">  
  Go to *Instance management* tab  
    <img width="533" alt="image" src="https://user-images.githubusercontent.com/61629889/234079310-a3701f86-0b12-4022-9d83-12f19568a667.png">
  
  - Step 6: Clean up resources  
    - Delete the Auto Scaling group | - Done         ✅  
    - Delete the Load Balancer | - Done              ✅  
    - Delete the Target group you created | - Done   ✅   
    - Delete your launch template | - Done           ✅  




### 3. Amazon EC2 Workshop (ADVANCED)
