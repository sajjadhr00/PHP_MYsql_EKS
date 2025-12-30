# Install aws and configure with access key and secret key

```cmd
aws configure
```
To verify install or not
```cmd
aws --version
```
# Intsall kubectl to depoloy depoyment and service yaml file
Open PowerShell as Administrator
```powershell
curl.exe -LO "https://dl.k8s.io/release/v1.30.0/bin/windows/amd64/kubectl.exe"
```
Move it to a system path so it can be run from anywhere:
```powershell
move .\kubectl.exe C:\Windows\System32\
```
Verify installation
```powershell
kubectl version --client
```
# Install eksctl for create AWS eks infra in aws
```
curl.exe -LO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_windows_amd64.zip"
```
Extract the zip
```
Expand-Archive -Path .\eksctl_windows_amd64.zip -DestinationPath .\
```
move to system32 path .exe file # it work as environment variables
```
move .\eksctl.exe C:\Windows\System32\
```
verify installation
```
eksctl version
```
# helm chart installation
open cmd
```
curl.exe -LO https://get.helm.sh/helm-v3.16.2-windows-amd64.zip
```
unzip
```
Expand-Archive helm-v3.16.2-windows-amd64.zip -DestinationPath .
```
move to registry
```
move .\windows-amd64\helm.exe C:\Windows\System32\
```










