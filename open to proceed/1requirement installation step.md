# install aws and configure with access key and secret key

```cmd
aws configure
```
To verify install or not
```cmd
aws --version
```
# intsall kubectl to depoloy depoyment and service yaml file
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









