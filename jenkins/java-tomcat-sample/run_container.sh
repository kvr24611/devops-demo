#!/bin/bash

image_version=$(cat ../image_version)
containerName="tomcat_container"
imageName=tomcat_local
docker container run -d --name $containerName -p 8083:8080 $imageName:$image_version
