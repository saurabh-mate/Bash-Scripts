#!/bin/bash
cd /home/saurabh/Tasks/Webs/My-Portfolio/ || exit

IMAGE_NAME="new_image"    
DOCKER_USERNAME="saurabhmate" 
TAG="latest"
CONTAINER_NAME="new_container"  

echo "Building Docker image..."
docker build -t "$IMAGE_NAME:$TAG" .


if docker ps -q --filter "name=$CONTAINER_NAME" | grep -q .; then
    echo "Stopping existing container..."
    docker stop "$CONTAINER_NAME"
    docker rm "$CONTAINER_NAME"
fi

echo "Running the Docker container..."
docker run -d --name "$CONTAINER_NAME" -p 8080:80 "$IMAGE_NAME:$TAG"

echo "Tagging the image..."
docker tag "$IMAGE_NAME:$TAG" "$DOCKER_USERNAME/$IMAGE_NAME:$TAG"

echo "Pushing the image to Docker Hub..."
docker push "$DOCKER_USERNAME/$IMAGE_NAME:$TAG"

docker  ps 