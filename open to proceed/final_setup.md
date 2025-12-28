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
eksctl create fargateprofile --cluster eyewear --region ap-south-1 --name eyewearweb --namespace eyewear
```
onece it created you can see aws-> eks-> eyewaer-> resource -> new farget profile
# now deploy deployment and service .yaml file to kubernetes to fetch web app from mention path by yaml file
```
kubectl apply -f https://github.com/sajjadhr00/PHP_MYsql_EKS/blob/main/depoyment%20and%20service/deployment.yaml
```


