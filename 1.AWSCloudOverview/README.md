# <p align=center>AWS Cloud Overview</p>   
***  
### 1. AWS Account creation.
*[YouTube Step 1](https://t.ly/7d9Wp)*
 - Done.
 > It quite simple so no need to describe.

### 2. Signing in with Root user
 - Done. 
 > Account ID: [6106-1439-6838](https://610614396838.signin.aws.amazon.com/console)

### 3. Enabling a virtual multi-factor authentication (MFA) device
 - Done. 
 > Root user has MFA (DuoMobile). This can be done in IAM dashboard.

### 4. Checking your Limits and navigating AWS console
*[YouTube Step 2](https://t.ly/13vow)*  
 - Done. 
 > Limits can be checked up [HERE](https://us-east-1.console.aws.amazon.com/ec2/home?region=us-east-1#Limits:sort=limitType). Limits can be inreased by creating a support ticket [HERE](https://support.console.aws.amazon.com/support/home?region=us-east-1#/case/create?issueType=service-limit-increase). Do not forget to chose a right region. 

### 5. Creating an IAM user in your AWS account
*[YouTube Step 5](https://t.ly/5jug)*
 - Done. 
 > IAM user: Vkuts   
Go to IAM - Users - Add Users - Attach policies directly - AdministratorAccess - Add tags (optional) - Create User.
Next we provide MFA as we did in the 3rd step.

### 6. Set Up the AWS Command Line Interface (AWS CLI)
 - Done. 
> Go to official [site](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) and follow instructions.
After installation output chould be like this
```bash
aws --version
aws-cli/2.6.0 Python/3.9.11 Darwin/22.3.0 exe/x86_64 prompt/off
```

### 7. Creating a Billing Alarm to Monitor Your Estimated AWS Charges
*[YouTube Step 4](https://t.ly/GUZL)*
 - Done. 
> Go to [billing preferences](https://us-east-1.console.aws.amazon.com/billing/home?region=us-east-1#/preferences) - Receive Billing Alerts - Manage Billing Alerts - Alarms - Billing. Create a treshold and remember, that e-mail confirmation is MANDATORY
 <img width="556" alt="image" src="https://user-images.githubusercontent.com/61629889/229310263-b2c7834a-9088-46e6-9fa4-4b4fe89b68ae.png">
