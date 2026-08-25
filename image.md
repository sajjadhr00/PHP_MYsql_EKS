# go to docker file path and open cmd

docker build -t <image name>:<tag>


aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 185542456565.dkr.ecr.ap-south-1.amazonaws.com

docker tag <existing image name in docker>:<existing image tag> 185542456565.dkr.ecr.ap-south-1.amazonaws.com/sajjad/eyewear:latest

docker push 185542456565.dkr.ecr.ap-south-1.amazonaws.com/sajjad/eyewear:latest
