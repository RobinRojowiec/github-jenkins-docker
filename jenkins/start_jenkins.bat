docker kill jenkins-local
docker rm jenkins-local
docker container run -d -p 80:8080 -v //var/run/docker.sock:/var/run/docker.sock -v jenkins_home:/var/jenkins_home --name jenkins-local robin/jenkins:latest