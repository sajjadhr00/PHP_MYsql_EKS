# note : run all command in powershell as administration
# create eks cluster - It will take time created

```
eksctl create cluster --name eyewear --region ap-south-1 --fargate
```
if any error come , delete the stack from cloud formation 
download aws eks cluster resouces get get update after download  2 command is use to get update
```
onece it created you can see aws-> eks-> eyewaer
aws eks update-kubeconfig --name eyewear --region ap-south-1
```
```
kubectl get nodes
```
# creating fargate profile , you can use exting also but in this we creating new one
```
eksctl create fargateprofile --cluster eyewear --region ap-south-1 --name eyewear --namespace eyewear
```
create kubuernetes namespace
```
kubectl create namespace eyewear
```
onece it created you can see aws-> eks-> eyewaer-> resource -> new farget profile
# Deploy the Kubernetes Deployment and Service YAML files to fetch and run the web application from the specified path
copy deployemnt link with raw format
```
kubectl apply -f https://raw.githubusercontent.com/sajjadhr00/PHP_MYsql_EKS/refs/heads/main/depoyment%20and%20service/deployment.yaml
```
# now we have to open aws -> eks -> resouces -> config and secret -> Secret -> db-secret
```
kubectl create secret generic db-secret --from-literal=DB_PASSWORD=<password> --from-literal=DB_HOST=<hostnameor ip> --from-literal=DB_NAME=<database name> --from-literal=DB_USER=<database user> -n eyewear
```
now fill credentials becauce eks fargate will connect with db with this credentials
<img width="1147" height="542" alt="image" src="https://github.com/user-attachments/assets/092e8735-2e9a-49c2-bedf-991b22e62ddf" />

# now check if deployment is started or not with this command , there will three state
# 1.pending
# 2.ContainerCreating
# 3.running

```
kubectl get pod -n eyewear
```
# check ingree status got public ip or not
```
kubectl get ingress -n eyewear
```
# you can acess website though eks dns link but within vpc but we need to access from publicly , so we need to setup ALB with heml but before we have to setup IAM oidc connector so ingress(pod) and connect with eks 
```
eksctl utils associate-iam-oidc-provider --cluster eyewear --approve
```
note: if get region error then recongifure aws region

# download IAM policy and create iam policy 
```
curl -O https://github.com/sajjadhr00/PHP_MYsql_EKS/blob/main/depoyment%20and%20service/IAM_policy.json
```
```
aws iam create-policy --policy-name AWSLoadBalancerControllerIAMPolicy --policy-document file://IAM_policy.json
```
# create service account , role and attach policy , note - mention your account number 
```
eksctl create iamserviceaccount --cluster=eyewear --namespace=kube-system --name=aws-load-balancer-controller --role-name AmazonEKSLoadBalancerControllerRole --attach-policy-arn=arn:aws:iam::<your-aws-account-id>:policy/AWSLoadBalancerControllerIAMPolicy
  --approve
```
# Deploy ALB controller
Add helm repo
```
helm repo add eks https://aws.github.io/eks-charts
```
Update the repo
```
helm repo update eks
```
install - mention your vpc id , region and cluster name
```
helm install aws-load-balancer-controller eks/aws-load-balancer-controller -n kube-system --set clusterName=eyewear --set serviceAccount.create=false --set serviceAccount.name=aws-load-balancer-controller --set region=ap-south-1 --set vpcId=<your-vpc-id>
```
Verify that the deployments are running , wait for 10 minutes
```
kubectl get deployment -n kube-system aws-load-balancer-controller -w
```
<img width="657" height="37" alt="image" src="https://github.com/user-attachments/assets/f81fdb84-4171-4898-b07a-9c834472ce49" />
when you get load balancer 2/2 in ready state then your load balancer is in working state
if not show in ready sate , you have to check aws load balancer deployment config by below command 
```
kubectl edit deploy/aws-load-balancer-controller -n kube-system
```
ALL the error mention in status 

# final verification public link generate process
```
kubectl get ingress -n eyewear
```
output:
<img width="1083" height="37" alt="image" src="https://github.com/user-attachments/assets/e300c965-c959-4057-91b1-a90500c8c767" />

wait 5 minute to became alb in active state 
# copy address and paste in browser , then you can see eyewear website

all the credential all website is store in Eyewaer/connection/shopping.sql











