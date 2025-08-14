VPC Setup:  
2 public and 2 private subnets in ap-south-1a and ap-south-1b respectively, with an Internet Gateway for public subnet access, a NAT Gateway for private subnet internet access, and route tables associated with their respective subnets.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------
EKS v1.28:  
Provisions an EKS cluster in private subnets with IAM roles, node group, VPC endpoint for private API access, optional custom AMI via launch template, attached IAM policies, Kubernetes provider using EKS auth token, admin access via AWS user ARN, and ensures secure, private connectivity with automated node bootstrapping.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------
Bastion Host:  
Create a public bastion host with open SSH (22), HTTP (80), HTTPS (443), and Kubernetes API (6443) ports for internet access, along with a private bastion in a private subnet accessible only via SSH from the public bastion, with tools (kubectl, aws-iam-authenticator, AWS CLI) installed, enabling secure SSH jump from local → public bastion → private bastion to manage the EKS cluster.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------
Usage Workflow:  
SSH from your local machine → Public Bastion Host (public subnet) #ssh -i eks-terraform-key.pem ec2-user@43.205.115.140

From Public Bastion → SSH into Private Bastion Host (private subnet) # ssh -i eks-terraform-key.pem ec2-user@10.0.10.34

From Private Bastion → Manage EKS cluster with installed tools (kubectl, AWS CLI, etc.) # Configure terraform-user accesskey and secret accesskey

How to Connect to Cluster (Make sure you are on private subnet instance)
[ec2-user@ip-10-0-10-34 ~]$ aws eks update-kubeconfig --region ap-south-1 --name private-eks-cluster 
--> Added new context arn:aws:eks:ap-south-1:890742584183:cluster/private-eks-cluster to /home/ec2-user/.kube/config

[ec2-user@ip-10-0-10-34 ~]$ kubectl get node 
NAME                                         STATUS   ROLES    AGE   VERSION
ip-10-0-10-106.ap-south-1.compute.internal   Ready    <none>   47m   v1.28.15-eks-3abbec1
ip-10-0-20-19.ap-south-1.compute.internal    Ready    <none>   47m   v1.28.15-eks-3abbec1
