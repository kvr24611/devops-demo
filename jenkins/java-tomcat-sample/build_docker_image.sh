#!/usr/bin/bash

imageName="tomcat_local"
containerName="tomcat_container"
jenkinsJobName="build-tomcat-container-image"




docker container stop $(docker container ps -a | awk -F ' ' '{print $1}'| tail -n +2) &> /dev/null
docker container rm -f $(docker container ps -a | awk -F ' ' '{print $1}'| tail -n +2) &> /dev/null
docker image rm -f $(docker images | awk -F ' ' '{print $3}' | tail -n +2) &> /dev/null

cd jenkins/java-tomcat-sample
docker image build -t $imageName:$BUILD_NUMBER .

cd /var/lib/jenkins/workspace/$jenkinsJobName
echo $BUILD_NUMBER > ../image_version
