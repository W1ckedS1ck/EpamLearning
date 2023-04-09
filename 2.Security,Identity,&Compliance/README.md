# <p align=center>Security Identity And Compliance Services</p>  
---

## Basic level

- AWS General Immersion Day: IAM Basic
  - Launch EC2 Instances with Tags  
    To run 2 instances we need to enter [EC2 Dashboard](https://us-east-1.console.aws.amazon.com/ec2/home?region=us-east-1#Home:) and click on *Launch instances* and select instance type.
    ![EC2 Dashboard](https://user-images.githubusercontent.com/61629889/229584539-890d229f-36f8-439f-84f7-0e673fff14a5.png)

  - Create AWS IAM Identities
    - Create IAM Policy to attach to IAM User group  
      Go to [IAM dashboard](https://us-east-1.console.aws.amazon.com/iamv2/home?region=us-east-1#/home), then *Account Alias*.
      ![IAM dashboard](https://user-images.githubusercontent.com/61629889/229593966-98eb0f9e-4698-4705-9f16-45c4365a5a4f.png)
      Next step is creating [policy](https://us-east-1.console.aws.amazon.com/iamv2/home#/policies):

      ```json
      {
          "Version": "2012-10-17",
          "Statement": [
              {
                  "Effect": "Allow",
                  "Action": "ec2:*",
                  "Resource": "*",
                  "Condition": {
                      "StringEquals": {
                          "ec2:ResourceTag/Env": "dev"
                      }
                  }
              },
              {
                  "Effect": "Allow",
                  "Action": "ec2:Describe*",
                  "Resource": "*"
              },
              {
                  "Effect": "Deny",
                  "Action": [
                      "ec2:DeleteTags",
                      "ec2:CreateTags"
                  ],
                  "Resource": "*"
              }
          ]
      }
      ```
      Success! The policy DevPolicy has been created.

    - Create IAM User group named dev-group  
      Heading to the [User groups](https://us-east-1.console.aws.amazon.com/iamv2/home#/groups), name it and attach DevPolicy
      dev-group user group created.
    - Create IAM User which name is dev-user placed in dev-group  
      In IAM tab click [Users](https://us-east-1.console.aws.amazon.com/iamv2/home#/users) and create the user with the name *dev-user* and pick **I want to create an IAM user** and add him to the *dev-group* just created on the next step.  
      <img width="418" alt="image" src="https://user-images.githubusercontent.com/61629889/229604116-2b914620-a0c4-47cf-93fa-df40a4604cf4.png">  
    - Test the access for resources  
      <img width="325" alt="image" src="https://user-images.githubusercontent.com/61629889/229604921-69ee1569-44dd-40de-b4f7-22b6ab1842ca.png">  
      Now Vasia can stop DEV instance (Successfully stopped i-0174049baeff9a392), but PROD can't (Failed to stop the instance i-018751259dc5b6f40)  
      <img width="577" alt="image" src="https://user-images.githubusercontent.com/61629889/229606337-fefccec5-4e85-45e8-ae2f-480c06b4a177.png">
  - Assign IAM Role for EC2 Instance and Test the access  
    To create S3 Bucket, enter into the [S3 console](https://s3.console.aws.amazon.com/s3/get-started) . And then, click **Create bucket** button
    <img width="1196" alt="image" src="https://user-images.githubusercontent.com/61629889/230357034-57e6e340-f1dd-471b-bf39-5326b462b9b2.png">  
  Move on to the IAM - Roles - Create role - AWS service - EC2 and create policy like we did before.  

    ```json
    {
        "Version": "2012-10-17",
        "Statement": [
            {
            "Action": ["s3:ListAllMyBuckets", "s3:GetBucketLocation"],
            "Effect": "Allow",
            "Resource": ["arn:aws:s3:::*"]
            },
            {
                "Effect": "Allow",
                "Action": [
                    "s3:Get*",
                    "s3:List*"
                ],
                "Resource": [
                    "arn:aws:s3:::iam-test-user_name/*",
                    "arn:aws:s3:::iam-test-user_name"
                ]
            }
        ]
    }  
     ```  
  
    The policy IAMBucketTestPolicy has been created. Then back to the previous tab and proceed with role *IAMBucketTestRole* creation.
    Role IAMBucketTestRole created.
    !!Check your Security Group to avoid connection issues!!  

    ```bash  
    aws s3 ls  
    Unable to locate credentials. You can configure credentials by running "aws configure".  
    ```  

    Update your IAM role: Back to the Instances page and select prod-instance. Click Actions button and select Security and click Modify IAM role. 
In IAM role, select *IAMBucketTestRole* and click Save button to attach IAM role to EC2 instance.  
    Successfully attached IAMBucketTestRole to instance i-018751259dc5b6f40
    <img width="806" alt="image" src="https://user-images.githubusercontent.com/61629889/230423606-70e9af8c-044c-4767-bcda-33d469f08cc5.png">

- Use The New Visual Editor To Create And Modify Your AWS IAM Policies  
  Heading to IAM, then [Create policy](https://us-east-1.console.aws.amazon.com/iam/home#/policies$new?step=edit), then chosing a *service* (S3 for example) and fill in *Access level* (list and read for example). Also we can pick separate policies by pressing tick next to the title or even filter by mask.  
  <img width="692" alt="image" src="https://user-images.githubusercontent.com/61629889/230717145-9fb8f274-a162-4581-b004-3590e6bb2023.png">  
  The policy NewVisualEditorPolicy has been created. Now we can review it's json
  ```json
    {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:ListAccessPointsForObjectLambda",
                "s3:GetObjectVersionTagging",
                "s3:GetStorageLensConfigurationTagging",
                "s3:GetObjectAcl",
                "s3:GetBucketObjectLockConfiguration",
                "s3:GetIntelligentTieringConfiguration",
                "s3:GetObjectVersionAcl",
                "s3:GetBucketPolicyStatus",
                "s3:GetObjectRetention",
                "s3:GetBucketWebsite",
                "s3:GetJobTagging",
                "s3:ListJobs",
                "s3:GetMultiRegionAccessPoint",
                "s3:GetObjectAttributes",
                "s3:GetObjectLegalHold",
                "s3:GetBucketNotification",
                "s3:DescribeMultiRegionAccessPointOperation",
                "s3:GetReplicationConfiguration",
                "s3:ListMultipartUploadParts",
                "s3:GetObject",
                "s3:DescribeJob",
                "s3:GetAnalyticsConfiguration",
                "s3:GetObjectVersionForReplication",
                "s3:GetAccessPointForObjectLambda",
                "s3:GetStorageLensDashboard",
                "s3:GetLifecycleConfiguration",
                "s3:GetAccessPoint",
                "s3:GetInventoryConfiguration",
                "s3:GetBucketTagging",
                "s3:GetAccessPointPolicyForObjectLambda",
                "s3:GetBucketLogging",
                "s3:ListBucketVersions",
                "s3:ListBucket",
                "s3:GetAccelerateConfiguration",
                "s3:GetObjectVersionAttributes",
                "s3:GetBucketPolicy",
                "s3:GetEncryptionConfiguration",
                "s3:GetObjectVersionTorrent",
                "s3:GetBucketRequestPayment",
                "s3:GetAccessPointPolicyStatus",
                "s3:GetObjectTagging",
                "s3:GetMetricsConfiguration",
                "s3:GetBucketOwnershipControls",
                "s3:GetBucketPublicAccessBlock",
                "s3:GetMultiRegionAccessPointPolicyStatus",
                "s3:ListBucketMultipartUploads",
                "s3:GetMultiRegionAccessPointPolicy",
                "s3:GetAccessPointPolicyStatusForObjectLambda",
                "s3:ListAccessPoints",
                "s3:GetBucketVersioning",
                "s3:ListMultiRegionAccessPoints",
                "s3:GetBucketAcl",
                "s3:GetAccessPointConfigurationForObjectLambda",
                "s3:ListStorageLensConfigurations",
                "s3:GetObjectTorrent",
                "s3:GetMultiRegionAccessPointRoutes",
                "s3:GetStorageLensConfiguration",
                "s3:GetAccountPublicAccessBlock",
                "s3:ListAllMyBuckets",
                "s3:GetBucketCORS",
                "s3:GetBucketLocation",
                "s3:GetAccessPointPolicy",
                "s3:GetObjectVersion"
            ],
            "Resource": "*",
            "Condition": {
                "IpAddress": {
                    "aws:SourceIp": "172.0.0.0/24"
                }
            }
        }
      ]
    }

 Policy ARN : arn:aws:iam::610614396838:policy/NewVisualEditorPolicy  
   > **_NOTE:_** By default, all actions you choose will be **allowed**. To **deny** actions, choose Switch to deny permissions in the upper right corner of the Actions section.  
---


## Advanced level

- Key Management: KMS

    Go to Key Management Service (KMS) - Customer-managed keys - [Create key](https://us-east-1.console.aws.amazon.com/kms/home?region=us-east-1#/kms/keys/create).  
    I chose Symmetric, Encrypt and decrypt, KMS. arn:aws:kms:us-east-1:610614396838:key/31019211-fbc3-470d-ac9a-b15f9e0aaa71 Now check how it works.
Connect to our PROD instance and create a file with very-secret-content named unencr.txt
    <img width="1588" alt="Screenshot at Apr 09 13-15-36" src="https://user-images.githubusercontent.com/61629889/230764787-312027f4-51d8-4149-9e17-26b2028efc4b.png">
    And now let's figure out what happened.
  1. (RED) User IAMBucketTestRole is not authorized to perform encrypting/decrypting. 
  2. (YELLOW) IAMBucketTestRole has been added to **Key users** in the KMS and voila - the user can encrypt the file.
  3. (GREEN) ENCR.txt has been successfully decrypted and we can see ours very-secret-content.
    ```bash
    aws kms encrypt --key-id 31019211-fbc3-470d-ac9a-b15f9e0aaa71 --plaintext fileb://unencr.txt --output text --query CiphertextBlob | base64 --decode > ENCR.txt
    
    aws kms decrypt --ciphertext-blob fileb://ENCR.txt --output text --query plaintext | base64 --decode > NEWunencr.txt
  ```
