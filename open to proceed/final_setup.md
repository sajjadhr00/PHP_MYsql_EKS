# note : run all command in powershell as administration
# create eks cluster - It will take time created
```
eksctl create cluster --name eyewear --region ap-south-1 --fargate
```
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
onece it created you can see aws-> eks-> eyewaer-> resource -> new farget profile
# Deploy the Kubernetes Deployment and Service YAML files to fetch and run the web application from the specified path
```
kubectl apply -f https://github.com/sajjadhr00/PHP_MYsql_EKS/blob/main/depoyment%20and%20service/deployment.yaml
```
# now we have to open aws -> eks -> resouces -> config and secret -> Secret -> db-secret 
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








