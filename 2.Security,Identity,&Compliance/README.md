# Security Identity And Compliance Services

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

  - Assign IAM Role for EC2 Instance and Test the access
    Now Vasia can stop DEV instance (Successfully stopped i-0174049baeff9a392), but PROD can't (Failed to stop the instance i-018751259dc5b6f40)
    <img width="577" alt="image" src="https://user-images.githubusercontent.com/61629889/229606337-fefccec5-4e85-45e8-ae2f-480c06b4a177.png">

- Use The New Visual Editor To Create And Modify Your AWS IAM Policies

---

## Advanced level

- Key Management: KMS
