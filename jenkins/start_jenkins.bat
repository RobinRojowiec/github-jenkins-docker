docker volume create jenkins_home || true
docker kill jenkins-master || true
docker run -d -p 8080:8080 -p 50000:50000 -v //var/run/docker.sock:/var/run/docker.sock -v jenkins_home:/var/jenkins_home --name jenkins-master robin/jenkins:latest
